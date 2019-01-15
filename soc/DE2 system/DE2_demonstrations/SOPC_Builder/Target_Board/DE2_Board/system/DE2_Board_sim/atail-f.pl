#Copyright (C)1991-2003 Altera Corporation
#Any megafunction design, and related net list (encrypted or decrypted),
#support information, device programming or simulation file, and any other
#associated documentation or information provided by Altera or a partner
#under Altera's Megafunction Partnership Program may be used only to
#program PLD devices (but not masked PLD devices) from Altera.  Any other
#use of such megafunction design, net list, support information, device
#programming or simulation file, or any other related documentation or
#information is prohibited for any other purpose, including, but not
#limited to modification, reverse engineering, de-compiling, or use with
#any other silicon devices, unless such use is explicitly licensed under
#a separate agreement with Altera or a megafunction partner.  Title to
#the intellectual property, including patents, copyrights, trademarks,
#trade secrets, or maskworks, embodied in any such megafunction design,
#net list, support information, device programming or simulation file, or
#any other related documentation or information provided by Altera or a
#megafunction partner, remains with Altera, the megafunction partner, or
#their respective licensors.  No other licenses, including any licenses
#needed under any third party's intellectual property, are provided herein.
#Copying or modifying any file, or portion thereof, to which this notice
#is attached violates this copyright.

# twayne: Thu Dec 18 11:16:11 PST 2003

# Here's a little thing emulates behavior of gnu 'tail -f' v2.02, 
# with a twist: the jtag_uart dumps data out as strings 8 of 0's and
# 1's, which need to be converted back into ascii characters.
# This is otherwise just like altera_avalon_uart's tail-f.pl.
# One argument only, the file to watch and echo characters from!

# run via 'perl -- atail-f.pl logfile'

# set program_name '$pname' to equivalent of csh's "$0:t"
@prog = split (/\/|\\/,$0) ; $pname = $prog[$#prog] ;

select(STDIN);  $| = 1;         # make stdin  unbufferred
select(STDOUT); $| = 1;         # make stdout unbufferred

$SIG{'INT'} = 'quit';		# run &quit on ^C

&usage if @ARGV < 1;		# die without 1 (file) arg

# Init variables:
$file = $ARGV[0];
$old_size = -1;
$size = 0;
$some_bytes = 0;
$char = 0;

################################################################
# test files for veracity
################################################################

die if (&args_test($file) && sleep 5);

################################################################
# Do the main loop
# Note that you have to use 'select' to get sub 1second delays.
# Once you use 'select' this way, you need to use the unbufferred
# sys{open,seek,read,write} commands instead of the bufferred
# open,seek,read,print equivalents, else you lose characters sent to the tty!
################################################################
while (1) {
    # Every time size gets crushed to 0, print when it happenned!
    if (($size == 0) && ($size != $old_size)) {
        $formatted_time = &get_formatted_time();
        syswrite (STDOUT,
"\n$pname: $file size is zero at time $formatted_time.\n".
"------------------------------------------------------------------------\n");
        $old_size = $size;
    }

    # get file size from stat:
    ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,
     $size,$atime,$mtime,$ctime,$blksize,$blocks)
        = stat($file);

    # print out new bytes, a'la unix's "tail -f"
    # only do work if your filesize has at least one whole new 01 string
    if ($size > $old_size) {
        sysopen (LOG, $file, O_RDONLY) or &ktb(); # ktb == KickTheBucket
        sysseek (LOG, $old_size, 0);
        sysread (LOG, $some_bytes, $size - $old_size);
        close(LOG);
        if ($some_bytes =~ /([\n\r]*)([01]{8})([\n\r]{1,2})/) {
            $pre_crlf = $1;
            $pre_char = $2;
            $postcrlf = $3;
            $old_size += length($pre_crlf)+length($pre_char)+length($postcrlf);
            @zero_ones = split (//,$pre_char);
            for ($i = 0 ; $i <= $#zero_ones ; $i++) { # $#zero_ones should be 8
                if ($zero_ones[$i] =~ /1/) {
                    $char += 2**(7-$i);
                }
            }
            syswrite (STDOUT, (pack "c",$char));
            $char = 0;
        }
     }
    # sleep 1;
    select(undef, undef, undef, 0.1);

} # end main loop [while TRUE]

################################################################
# subroutines
################################################################
sub usage {
    die "usage: $pname logfile\n";
} # usage

sub quit {			# interrupt handler for exit
    local ($sig) = @_;
    print STDERR "Caught SIG$sig; exiting...\n";
    close (LOG);
    sleep 1;
    exit;
} # quit

sub ktb {			# kick the bucket if file disappears
    local ($file) = @_;
    print STDERR "$pname: $file is gone!; exiting...\n";
    sleep 1;
    exit 1;
} # quit

sub args_test {			# return 0 for success; return 1 for fail
    local ($file) = @_;
    local $code = " ";
    local $die  = 0;

    # print STDERR "$pname: Checking arguments...\n";

    if (defined (open (LOG, $file))) { 
	close(LOG);		# success
    } else {
	$code = "$!\n";		# remember fail reason
    }

    if ($code ne " ") {
        print STDERR "$pname: Cannot open '$file': $code";
        $die = 1;		# remember any failure
    }

    return $die;		# return any failure status.

} # args_test

sub get_formatted_time {        # create a timestring without using packages
    my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
    return (sprintf ("%.2d:%.2d:%.2d %.2d/%.2d/%.4d", $hour,$min,$sec,($mon + 1),$mday,($year + 1900)));
} # get_formatted_time
