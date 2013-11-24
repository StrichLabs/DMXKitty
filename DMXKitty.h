/* 
 * File:   StrichLuxIOETH.h
 * Author: sarahemm
 *
 * Created on July 1, 2012, 11:24 AM
 */

#ifndef STRICHLUXIOETH_H
#define	STRICHLUXIOETH_H

#ifdef	__cplusplus
extern "C" {
#endif

#include <plib.h>
#include <ArtNet.h>
#include <Config.h>
    
extern BYTE dmx_buffer[513];
extern BOOL ResetRequired;
extern BOOL CfgDirty;
extern struct ConfigBlock CfgBlock;
extern struct ConfigBlock FlashCfgBlock;

static void InitAppConfig(struct ConfigBlock);
static void AssemblePollReplyPacket(struct ArtPollReply *);
static void InputArtNetTask(void);
static void OutputArtNetTask(void);

#define CFG_RESERVED_BLOCKS 0xFF
// 0xBD07FFFF for devboard
// 0xBD01FFFF for dmxkitty
#define CFG_START_ADDR      (0xBD01FFFF - CFG_RESERVED_BLOCKS)

#ifdef	__cplusplus
}
#endif

#endif	/* STRICHLUXIOETH_H */

