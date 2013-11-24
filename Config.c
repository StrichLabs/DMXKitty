#include <DMXKitty.h>
#include <Config.h>
#include <String.h>

void ConfigInit(struct ConfigBlock *CfgBlock) {
    strcpy(CfgBlock->Magic, "_DKCFG_\000");
    CfgBlock->IPAddress = 1 << (3*8) | 0 << (2*8)   | 0 << (1*8)   | 10;    // 10.0.0.1
    CfgBlock->Netmask   = 0 << (3*8) | 255 << (2*8) | 255 << (1*8) | 255;   // 255.255.255.0
    CfgBlock->Mode      = MODE_DMX_TO_ARTNET;
    CfgBlock->Universe  = 0;
}

void ConfigLoad(struct ConfigBlock FlashCfgBlock, struct ConfigBlock *CfgBlock) {
    if(strncmp(FlashCfgBlock.Magic, "_DKCFG_", 7) == 0) {
        memcpy(CfgBlock, &FlashCfgBlock, sizeof(FlashCfgBlock));
//        1;
    } else {
        ConfigInit(CfgBlock);
//        ConfigSave(*CfgBlock);
    }
}

void ConfigSave(struct ConfigBlock CfgBlock) {
    BYTE word;
    unsigned int *CfgBlockPtr = (unsigned int)&CfgBlock;
    
    NVMErasePage((void *)CFG_START_ADDR);

    for(word=0; word<32; word+=4) {
        if(NVMWriteWord((void *)CFG_START_ADDR+word, *CfgBlockPtr) != 0) {
            break;
        }
        CfgBlockPtr++;
    }
}