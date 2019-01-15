# TCL File Generated by Component Editor 9.0
# Tue Apr 03 15:37:41 CST 2018
# DO NOT MODIFY


# +-----------------------------------
# | 
# | vendor3_top_3 "vendor3_top_3" v1.0
# | null 2018.04.03.15:37:41
# | 
# | 
# | C:/Users/Dell/Desktop/avalon_sis/vendor3_top.v
# | 
# |    ./vendor3_top.v syn, sim
# |    ./vendor3.v syn, sim
# |    ./uppulsecheck.v syn, sim
# |    ./leddisplay.v syn, sim
# | 
# +-----------------------------------


# +-----------------------------------
# | module vendor3_top_3
# | 
set_module_property NAME vendor3_top_3
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property GROUP Other
set_module_property DISPLAY_NAME vendor3_top_3
set_module_property TOP_LEVEL_HDL_FILE vendor3_top.v
set_module_property TOP_LEVEL_HDL_MODULE vendor3_top
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE false
# | 
# +-----------------------------------

# +-----------------------------------
# | files
# | 
add_file vendor3_top.v {SYNTHESIS SIMULATION}
add_file vendor3.v {SYNTHESIS SIMULATION}
add_file uppulsecheck.v {SYNTHESIS SIMULATION}
add_file leddisplay.v {SYNTHESIS SIMULATION}
# | 
# +-----------------------------------

# +-----------------------------------
# | parameters
# | 
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point clock_reset
# | 
add_interface clock_reset clock end
set_interface_property clock_reset ptfSchematicName ""

set_interface_property clock_reset ENABLED true

add_interface_port clock_reset clk clk Input 1
add_interface_port clock_reset reset_n reset_n Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point avalon_slave_0
# | 
add_interface avalon_slave_0 avalon end
set_interface_property avalon_slave_0 addressAlignment NATIVE
set_interface_property avalon_slave_0 bridgesToMaster ""
set_interface_property avalon_slave_0 burstOnBurstBoundariesOnly false
set_interface_property avalon_slave_0 holdTime 0
set_interface_property avalon_slave_0 isMemoryDevice false
set_interface_property avalon_slave_0 isNonVolatileStorage false
set_interface_property avalon_slave_0 linewrapBursts false
set_interface_property avalon_slave_0 maximumPendingReadTransactions 0
set_interface_property avalon_slave_0 printableDevice false
set_interface_property avalon_slave_0 readLatency 0
set_interface_property avalon_slave_0 readWaitTime 1
set_interface_property avalon_slave_0 setupTime 0
set_interface_property avalon_slave_0 timingUnits Cycles
set_interface_property avalon_slave_0 writeWaitTime 0

set_interface_property avalon_slave_0 ASSOCIATED_CLOCK clock_reset
set_interface_property avalon_slave_0 ENABLED true

add_interface_port avalon_slave_0 chipselect chipselect Input 1
add_interface_port avalon_slave_0 write write Input 1
add_interface_port avalon_slave_0 writedata writedata Input 32
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point conduit_end
# | 
add_interface conduit_end conduit end

set_interface_property conduit_end ASSOCIATED_CLOCK clock_reset
set_interface_property conduit_end ENABLED true

add_interface_port conduit_end LEDG export Output 8
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point conduit_end_1
# | 
add_interface conduit_end_1 conduit end

set_interface_property conduit_end_1 ENABLED true

add_interface_port conduit_end_1 HEX0 export Output 7
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point conduit_end_2
# | 
add_interface conduit_end_2 conduit end

set_interface_property conduit_end_2 ASSOCIATED_CLOCK clock_reset
set_interface_property conduit_end_2 ENABLED true

add_interface_port conduit_end_2 HEX1 export Output 7
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point conduit_end_3
# | 
add_interface conduit_end_3 conduit end

set_interface_property conduit_end_3 ASSOCIATED_CLOCK clock_reset
set_interface_property conduit_end_3 ENABLED true

add_interface_port conduit_end_3 HEX2 export Output 7
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point conduit_end_4
# | 
add_interface conduit_end_4 conduit end

set_interface_property conduit_end_4 ASSOCIATED_CLOCK clock_reset
set_interface_property conduit_end_4 ENABLED true

add_interface_port conduit_end_4 HEX3 export Output 7
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point conduit_end_5
# | 
add_interface conduit_end_5 conduit end

set_interface_property conduit_end_5 ASSOCIATED_CLOCK clock_reset
set_interface_property conduit_end_5 ENABLED true

add_interface_port conduit_end_5 HEX4 export Output 7
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point conduit_end_6
# | 
add_interface conduit_end_6 conduit end

set_interface_property conduit_end_6 ASSOCIATED_CLOCK clock_reset
set_interface_property conduit_end_6 ENABLED true

add_interface_port conduit_end_6 HEX5 export Output 7
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point conduit_end_7
# | 
add_interface conduit_end_7 conduit end

set_interface_property conduit_end_7 ASSOCIATED_CLOCK clock_reset
set_interface_property conduit_end_7 ENABLED true

add_interface_port conduit_end_7 HEX6 export Output 7
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point conduit_end_8
# | 
add_interface conduit_end_8 conduit end

set_interface_property conduit_end_8 ASSOCIATED_CLOCK clock_reset
set_interface_property conduit_end_8 ENABLED true

add_interface_port conduit_end_8 HEX7 export Output 7
# | 
# +-----------------------------------