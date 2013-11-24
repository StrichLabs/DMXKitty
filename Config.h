/* 
 * File:   Config.h
 * Author: sarahemm
 *
 * Created on March 17, 2013, 11:48 AM
 */

#include <stdint.h>

#ifndef CONFIG_H
#define	CONFIG_H

#ifdef	__cplusplus
extern "C" {
#endif

// must be kept a multiple of 32 bits so it can be aligned in flash
// the reservation in DMXKitty.c
struct ConfigBlock {
  char      Magic[8];
  uint32_t  IPAddress;
  uint32_t  Netmask;
  uint8_t   Mode;
  uint8_t   Universe;
};

#define MODE_ARTNET_TO_DMX  0
#define MODE_DMX_TO_ARTNET  1

void ConfigInit(struct ConfigBlock *);
void ConfigLoad(struct ConfigBlock, struct ConfigBlock *);
void ConfigSave(struct ConfigBlock);


#ifdef	__cplusplus
}
#endif

#endif	/* CONFIG_H */

