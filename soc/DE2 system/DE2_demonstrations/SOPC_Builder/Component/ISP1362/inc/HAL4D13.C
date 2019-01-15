
#include <io.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include "system.h"
#include "sys/alt_irq.h"
#include "BasicTyp.h"
#include "common.h"
#include "HAL4D13.h"
#include "usb_irq.h"

/*
// ************************************************************************
// Subroutines -- 1
// ************************************************************************
*/

void Hal4D13_AcquireD13(unsigned char g_host_IRQ_num,void *usb_isr)
{
  alt_irq_register(g_host_IRQ_num,NULL,usb_isr);
}

void Hal4D13_ResetDevice(void)
{
  IOWR(ISP1362_BASE,D13_COMMAND_PORT,D13CMD_DEV_RESET);
}

USHORT Hal4D13_GetDevConfig(void)
{
  USHORT i; 
  IOWR(ISP1362_BASE,D13_COMMAND_PORT,D13CMD_DEV_RD_CNFG);
  i = IORD(ISP1362_BASE,D13_DATA_PORT);
  return i;
}

void Hal4D13_SetDevConfig(USHORT wDevCnfg)
{
  IOWR(ISP1362_BASE,D13_COMMAND_PORT,D13CMD_DEV_WR_CNFG);
  IOWR(ISP1362_BASE,D13_DATA_PORT, wDevCnfg);
}

void Hal4D13_SetMode(UCHAR bMode)
{
  IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_DEV_WR_MODE);
  IOWR(ISP1362_BASE,D13_DATA_PORT, bMode);
}

UCHAR Hal4D13_GetMode(void)
{
	UCHAR c;   
  IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_DEV_RD_MODE);
  c = (UCHAR)(IORD(ISP1362_BASE,D13_DATA_PORT) & 0x0ff);
	return c;
}

UCHAR Hal4D13_GetAddress(void)
{
	UCHAR c; 
	IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_DEV_RD_ADDR);
	c = (UCHAR)(IORD(ISP1362_BASE,D13_DATA_PORT) & 0x0ff);
	return c;
}

void Hal4D13_SetAddressEnable(UCHAR bAddress, UCHAR bEnable)
{
  IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_DEV_WR_ADDR);
  if(bEnable)
  bAddress |= D13REG_DEVADDR_EN;
  else
  bAddress &= D13REG_DEVADDR_MASK;
  IOWR(ISP1362_BASE,D13_DATA_PORT, bAddress);
}

void Hal4D13_SoftConnect(UCHAR bEnable)
{
	UCHAR c;
  IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_DEV_RD_MODE);
  c = (UCHAR)(IORD(ISP1362_BASE,D13_DATA_PORT) & 0x0ff);
  if(bEnable)
  c |= D13REG_MODE_SOFTCONNECT;
  else
  c &= ~D13REG_MODE_SOFTCONNECT;  
	IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_DEV_WR_MODE);
  IOWR(ISP1362_BASE,D13_DATA_PORT, c);
}

void Hal4D13_AcknowledgeSETUP(void)
{
  IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_ACK_SETUP);
}

void Hal4D13_ClearBuffer(UCHAR bEPIndex)
{
  /* Select Endpoint */
	IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_EP_CLEAR_BUF + bEPIndex);
}

void Hal4D13_ValidBuffer(UCHAR bEPIndex)
{
	IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_EP_VALID_BUF + bEPIndex);
}

USHORT Hal4D13_ReadEndpoint(UCHAR bEPIndex, UCHAR *buf, USHORT len)
{
	USHORT i, j, c;
	IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_EP_RD_FIFO + bEPIndex);
	/* read Buffer */
	j = IORD(ISP1362_BASE,D13_DATA_PORT);
	if(j > len)
		j = len;
	i=0;
	while (i<j)//<<
	//for(i=0; i<j; i=i+2, buf++ )
	{
		c = IORD(ISP1362_BASE,D13_DATA_PORT);
		*buf = (UCHAR)c;
		i++;//<<
		if (i >= j) break; //<<
		buf++;
		*buf = (UCHAR)(c>>8);
		i++;//<<
         buf++;
	}
	/* Clear Buffer */
	IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_EP_CLEAR_BUF+bEPIndex);
	return j;

}

USHORT Hal4D13_ReadBulkEndpoint(UCHAR bEPIndex, UCHAR * buf, USHORT len)
{
	USHORT i, j, c;
	IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_EP_RD_FIFO + bEPIndex);
	j = IORD(ISP1362_BASE,D13_DATA_PORT);
	if(j > len)
		j = len;
    i=0;
	while (i<j) //<<
//	for(i=0; i<j; i=i+2, buf++ )
	{
		c = IORD(ISP1362_BASE,D13_DATA_PORT);
		*buf = (UCHAR)c;
		i++;//<<
		if (i >= j) break; //<<
		buf++;
		*buf = (UCHAR)(c>>8);
    
		i++;//<<
    buf++;
	}
	/* Clear Buffer */
	IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_EP_CLEAR_BUF+bEPIndex);

	return j;
}

USHORT Hal4D13_ReadEndpointWOClearBuffer(UCHAR bEPIndex, UCHAR * buf, USHORT len)
{
	USHORT i, j,c;
	IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_EP_RD_FIFO + bEPIndex);
	/* read Buffer */
	j = IORD(ISP1362_BASE,D13_DATA_PORT);
	if(j > len)
		j = len;
    i=0;
	while (i<j) //<<	
   //for(i<j; i=i+2, buf++ )
	{
		 c = IORD(ISP1362_BASE,D13_DATA_PORT);
		 *buf = (UCHAR)c;//printf("WOC= %02X ",*buf);//<<        
		 i++;//<<
		 if (i >= j) break; //<<
		 buf++;
		 *buf = (UCHAR)(c>>8); //printf("WOC= %02X ",*buf);//<<
		 i++;//<<
     buf++;
	}
   // printf("\n",c);
	/* Clear Buffer */
	IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_EP_CLEAR_BUF+bEPIndex);

	return j;
}

USHORT Hal4D13_WriteEndpoint(UCHAR bEPIndex, UCHAR * buf, USHORT len)
{
	USHORT i,c;
	/* Select Endpoint */
   
	IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_EP_WR_FIFO + bEPIndex);
	IOWR(ISP1362_BASE,D13_DATA_PORT, len);
    if (len==0) IOWR(ISP1362_BASE,D13_DATA_PORT, 0);
	/* Write Buffer */
  
	//for(i=0; i<len; i=i+2, buf++ )
  i=0;
  while (i < len)
	{
		c = *buf;
		buf++;i++;
    if (i >=len) { IOWR(ISP1362_BASE,D13_DATA_PORT, c); }//printf("w=%04x  ",c);break; }
		c =(c & 0xff)+ (*buf<<8  & 0xff00);    
    buf++;i++;      
		IOWR(ISP1362_BASE,D13_DATA_PORT, c);
//    printf("w=%04x  ",c);
	}
//  printf("\nlen=%d i=%d\n",len,i);
  
	/* Validate Buffer */
	IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_EP_VALID_BUF+bEPIndex);
 // printf("\n");
	return i;
}

USHORT Hal4D13_WriteBulkEndpoint(UCHAR bEPIndex, UCHAR * buf, USHORT len)
{
	USHORT i, c;
	/* Select Endpoint */
	IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_EP_WR_FIFO + bEPIndex);
	IOWR(ISP1362_BASE,D13_DATA_PORT, len);
    if (len==0) IOWR(ISP1362_BASE,D13_DATA_PORT, 0);

	/* Write Buffer */
	for(i=0; i<len; i=i+2, buf++ )
	{
		c = *buf;
		buf++;
		c += (USHORT)(*buf << 8);
		IOWR(ISP1362_BASE,D13_DATA_PORT, c);
	}
	/* Validate Buffer */
	IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_EP_VALID_BUF+bEPIndex);
	return len;
}

ULONG Hal4D13_GetIntEnable(void)
{
	ULONG i;
	IOWR(ISP1362_BASE,D13_COMMAND_PORT,D13CMD_DEV_RD_INTEN);
	i = IORD(ISP1362_BASE,D13_DATA_PORT);
	i += (((ULONG)IORD(ISP1362_BASE,D13_DATA_PORT)) << 16);
	return i;
}

void Hal4D13_SetIntEnable(ULONG dIntEn)
{
	IOWR(ISP1362_BASE,D13_COMMAND_PORT,D13CMD_DEV_WR_INTEN);
	dIntEn = (dIntEn & 0x0FFFFFF);
	IOWR(ISP1362_BASE,D13_DATA_PORT,(USHORT)dIntEn);
	IOWR(ISP1362_BASE,D13_DATA_PORT,(USHORT)(dIntEn >> 16));
}

ULONG Hal4D13_ReadInterruptRegister(void)
{
	ULONG j,i = 0;
	IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_DEV_INT_SRC);
	i = IORD(ISP1362_BASE,D13_DATA_PORT);
	j = IORD(ISP1362_BASE,D13_DATA_PORT);
    j = ((j<<16) & 0xffff0000 ) + (i & 0xffff);
	return i;
}

UCHAR Hal4D13_GetEndpointStatusWInteruptClear(UCHAR bEPIndex)
{
	UCHAR c;
	IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_EP_RDSTS_CLRINT + bEPIndex);
	c = (UCHAR)(IORD(ISP1362_BASE,D13_DATA_PORT) & 0x0ff);
	return c;
}

UCHAR Hal4D13_GetEndpointStatusWOInteruptClear(UCHAR bEPIndex)
{
	UCHAR c;
	IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_EP_RDSTS + bEPIndex);
	c = (UCHAR)(IORD(ISP1362_BASE,D13_DATA_PORT) &0x0ff);
	return c;
}

void Hal4D13_SetEndpointStatus(UCHAR bEPIndex, UCHAR bStalled)
{
	if(bStalled & 0x80)
	{
		IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_EP_WR_STS + bEPIndex);
	}
	else
	{
    // clear endpoint stall.
		IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_EP_CLR_STALL + bEPIndex);
	}
}

void Hal4D13_SetDMAConfig(USHORT wDMACnfg)
{
	IOWR(ISP1362_BASE,D13_COMMAND_PORT,D13CMD_DMA_WR_CNFG);
	IOWR(ISP1362_BASE,D13_DATA_PORT, wDMACnfg);
}

USHORT Hal4D13_GetDMAConfig(void)
{
	USHORT i;
	IOWR(ISP1362_BASE,D13_COMMAND_PORT,D13CMD_DMA_RD_CNFG);
	i = IORD(ISP1362_BASE,D13_DATA_PORT);
	return i;
}

void Hal4D13_SetDMACounter(USHORT wDMACounter)
{
	IOWR(ISP1362_BASE,D13_COMMAND_PORT,D13CMD_DMA_WR_COUNT);
	IOWR(ISP1362_BASE,D13_DATA_PORT, wDMACounter);
}

USHORT Hal4D13_GetDMACounter(void)
{
	USHORT i;
	IOWR(ISP1362_BASE,D13_COMMAND_PORT,D13CMD_DMA_RD_COUNT);
	i = IORD(ISP1362_BASE,D13_DATA_PORT);
	return i;
}

USHORT Hal4D13_GetDataFromChipRam(void)
{
	USHORT i;
	IOWR(ISP1362_BASE,D13_COMMAND_PORT,D13CMD_DEV_RD_RAM);
	i = IORD(ISP1362_BASE,D13_DATA_PORT);
	return i;
}

void Hal4D13_SetDataToChipRam(USHORT wData)
{
	IOWR(ISP1362_BASE,D13_COMMAND_PORT,D13CMD_DEV_WR_RAM);
	IOWR(ISP1362_BASE,D13_DATA_PORT, wData);
}

USHORT Hal4D13_ReadCurrentFrameNumber(void)
{
	USHORT i;
	IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_RD_FRMNUM);
	i= IORD(ISP1362_BASE,D13_DATA_PORT);
	return i;
}

void Hal4D13_LockDevice(UCHAR bTrue)
{
	USHORT c;
	if(bTrue)
		c = 0;
	else
		c = 0xAA37;
	IOWR(ISP1362_BASE,D13_COMMAND_PORT,D13CMD_DEV_LOCK );
	IOWR(ISP1362_BASE,D13_DATA_PORT,c);
}

USHORT Hal4D13_ReadChipID(void)
{
	USHORT i;
	IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_DEV_RD_CHIPID);
	i=IORD(ISP1362_BASE,D13_DATA_PORT);
	return i;
}

UCHAR Hal4D13_GetErrorCode(UCHAR bEPIndex)
{
	UCHAR   c;
	IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_EP_RD_ERR+bEPIndex);
	c = (UCHAR)(IORD(ISP1362_BASE,D13_DATA_PORT)&0x0ff);
	return c;
}

UCHAR Hal4D13_GetEndpointConfig(UCHAR bEPIndex)
{
	UCHAR   c;
	IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_EP_RD_CNFG+bEPIndex);
	c = (UCHAR)(IORD(ISP1362_BASE,D13_DATA_PORT) & 0x0ff);
	return c;
}

void Hal4D13_SetEndpointConfig(UCHAR bEPConfig, UCHAR bEPIndex)
{
	IOWR(ISP1362_BASE,D13_COMMAND_PORT, (USHORT)(D13CMD_EP_WR_CNFG+bEPIndex));
	IOWR(ISP1362_BASE,D13_DATA_PORT,(USHORT)bEPConfig);
}

/*
// ************************************************************************
// Subroutines -- 3
// ************************************************************************
*/
void Hal4D13_UnconfigDevice(void)
{
}

void Hal4D13_ConfigDevice(void)
{
}


void Hal4D13_SingleTransmitEP0(UCHAR * buf, USHORT len)
{
	if( len <= EP0_PACKET_SIZE) {
		Hal4D13_WriteEndpoint(EPINDEX4EP0_CONTROL_IN, buf, len);
	}
}

void Hal4D13_RegAccess(void)
{
	USHORT   c;
	USHORT  i;
	ULONG   l;

	Hal4D13_ResetDevice();
	printf("Reseting\n");

	i = Hal4D13_ReadChipID();
	printf(" ChipId = %hx\n",i);

	i = Hal4D13_GetDataFromChipRam();
	printf(" Chip RAM = %hx\n",i);

	printf("Writing 0x55AA,");
	Hal4D13_SetDataToChipRam(0x55AA);
	i = Hal4D13_GetDataFromChipRam();
	printf(" Chip RAM = %hx\n",i);

	l = Hal4D13_GetIntEnable();
	printf("Hal4D13_GetIntEnable = %lx\n",l);

	l = Hal4D13_ReadInterruptRegister();
	printf("Hal4D13_ReadInterruptRegister = %lx\n",l);

	i = Hal4D13_GetDevConfig();
	printf("Hal4D13_GetDevConfig = %hx\n",i);

	i = Hal4D13_GetDMAConfig();
	printf("Hal4D13_GetDMAConfig = %hx\n",i);

	i = Hal4D13_GetDMACounter();
	printf("Hal4D13_GetDMACounter = %hx\n",i);

	i = Hal4D13_ReadCurrentFrameNumber();
	printf("Hal4D13_ReadCurrentFrameNumber = %hx\n",i);

	c = Hal4D13_GetMode();
	printf("Hal4D13_GetMode = %x\n",c);

	c = Hal4D13_GetEndpointStatusWOInteruptClear(EPINDEX4EP0_CONTROL_OUT);
	printf("Hal4D13_GetEndpointStatus EP0 = %x\n",c);

	c = Hal4D13_GetAddress();
//	printf("Hal4D13_GetAddress = %x\n",c);
}

void Hal4D13_StallEP0InControlWrite(void)
{
	Hal4D13_SetEndpointStatus(EPINDEX4EP0_CONTROL_IN, D13REG_EPSTS_STALL);
	Hal4D13_SetEndpointStatus(EPINDEX4EP0_CONTROL_OUT, D13REG_EPSTS_STALL);
}

void Hal4D13_StallEP0InControlRead(void)
{
	Hal4D13_SetEndpointStatus(EPINDEX4EP0_CONTROL_OUT, D13REG_EPSTS_STALL);
	Hal4D13_SetEndpointStatus(EPINDEX4EP0_CONTROL_IN, D13REG_EPSTS_STALL);
}

BOOLEAN Hal4D13_IsSetupPktInvalid(void)
{
	USHORT SetupPacketInvalid;
	SetupPacketInvalid = Hal4D13_GetEndpointStatusWOInteruptClear(EPINDEX4EP0_CONTROL_OUT)&D13REG_EPSTS_OVWR;
	return SetupPacketInvalid;
}

void Write_HC_Config_Reg(unsigned short Config)
{
	IOWR(ISP1362_BASE,HC_COMMAND_PORT , HCCMD_WR_CNFG_REG );
	IOWR(ISP1362_BASE,HC_DATA_PORT , Config);
}

unsigned short Read_HC_Config_Reg(void)
{
	IOWR(ISP1362_BASE,HC_COMMAND_PORT , HCCMD_RD_CNFG_REG );
	return IORD(ISP1362_BASE,HC_DATA_PORT);
}

