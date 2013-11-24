/* 
 * File:   ArtNet.h
 * Author: sen
 *
 * Created on June 21, 2012, 8:17 AM
 */

#include <stdint.h>

#ifndef ARTNET_H
#define	ARTNET_H

#ifdef	__cplusplus
extern "C" {
#endif

struct ArtPoll {
  char      ID[8];
  uint16_t  OpCode;
  uint16_t  ProtVer;
  uint8_t   TalkToMe;
  uint8_t   Priority;
};

struct ArtPollReply {
  char      ID[8];
  uint16_t  OpCode;
  uint8_t   IPAddress[4];
  uint16_t  Port;
  uint16_t  VersInfo;
  uint8_t   NetSwitch;
  uint8_t   SubSwitch;
  uint16_t  Oem;
  uint8_t   UbeaVersion;
  uint8_t   Status1;
  uint16_t  EstaMan;
  char      ShortName[18];
  char      LongName[64];
  char      NodeReport[64];
  uint8_t   NumPortsHi;
  uint8_t   NumPortsLo;
  uint8_t   PortTypes[4];
  uint8_t   GoodInput[4];
  uint8_t   GoodOutput[4];
  uint8_t   SwIn[4];
  uint8_t   SwOut[4];
  uint8_t   SwVideo;
  uint8_t   SwMacro;
  uint8_t   SwRemote;
  uint8_t   Spare1;
  uint8_t   Spare2;
  uint8_t   Spare3;
  uint8_t   Style;
  uint8_t   MAC[6];
  uint8_t   BindIp[4];
  uint8_t   BindIndex;
  uint8_t   Status2;
  uint8_t   Filler[26];
};

struct ArtDmx {
  char      ID[8];
  uint16_t  OpCode;
  uint16_t  ProtVer;
  uint8_t   Sequence;
  uint8_t   Physical;
  uint8_t   SubUni;
  uint8_t   Net;
  uint8_t   LengthHi;
  uint8_t   LengthLo;
  uint8_t   Data[512];
};

#define OpPoll      0x2000
#define OpPollReply 0x2100
#define OpDmx       0x5000

#define OpOutput    OpDmx

#define PollStatusIndicatorLocate   0x40
#define PollStatusIndicatorMute     0x80
#define PollStatusIndicatorNormal   0xC0
#define PollStatusNetworkPanel      0x18
#define PollStatusNetworkAddr       0x10
#define PollStatusBootedFromROM     0x04
#define PollStatusRDMCapable        0x02
#define PollStatusUBEAPresent       0x01

#define PortTypeDMX                 0x00
#define PortTypeMIDI                0x01
#define PortTypeAvab                0x02
#define PortTypeColorTranCMX        0x03
#define PortTypeADB                 0x04
#define PortTypeArtNet              0x05
#define PortTypeInput               0x40
#define PortTypeOutput              0x80

#define PortGoodReceiving           0x80
#define PortGoodSending             0x80
#define PortGoodDMXTest             0x40
#define PortGoodDMXSIPs             0x20
#define PortGoodDMXText             0x10
#define PortGoodDisabled            0x08
#define PortGoodMerging             0x08
#define PortGoodErrors              0x04
#define PortGoodShorted             0x04
#define PortGoodMergingLTP          0x02

#define StNode                      0x00
#define StController                0x01
#define StMedia                     0x02
#define StRoute                     0x03
#define StBackup                    0x04
#define StConfig                    0x05
#define StVisual                    0x06

#define PollStatus2SupportsHTTP      0x01
#define PollStatus2ManualIP          0x02
#define PollStatus2SupportsDHCP      0x04
#define PollStatus2Supports15BitAddr 0x08

#ifdef	__cplusplus
}
#endif

#endif	/* ARTNET_H */

