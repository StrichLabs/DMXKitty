#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/DMXKitty.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/DMXKitty.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED="../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/ARP.c" "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/UDP.c" "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/Tick.c" "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/IP.c" "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/Helpers.c" "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/StackTsk.c" "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/ICMP.c" "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/Delay.c" "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/TCP.c" "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/ETHPIC32IntMac.c" "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/ETHPIC32ExtPhy.c" ETHPIC32ExtPhyKSZ8051MLL.c StatusLEDs.c DMXKitty.c DMX.c Telnet.c Config.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1807225790/ARP.o ${OBJECTDIR}/_ext/1807225790/UDP.o ${OBJECTDIR}/_ext/1807225790/Tick.o ${OBJECTDIR}/_ext/1807225790/IP.o ${OBJECTDIR}/_ext/1807225790/Helpers.o ${OBJECTDIR}/_ext/1807225790/StackTsk.o ${OBJECTDIR}/_ext/1807225790/ICMP.o ${OBJECTDIR}/_ext/1807225790/Delay.o ${OBJECTDIR}/_ext/1807225790/TCP.o ${OBJECTDIR}/_ext/1807225790/ETHPIC32IntMac.o ${OBJECTDIR}/_ext/1807225790/ETHPIC32ExtPhy.o ${OBJECTDIR}/ETHPIC32ExtPhyKSZ8051MLL.o ${OBJECTDIR}/StatusLEDs.o ${OBJECTDIR}/DMXKitty.o ${OBJECTDIR}/DMX.o ${OBJECTDIR}/Telnet.o ${OBJECTDIR}/Config.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1807225790/ARP.o.d ${OBJECTDIR}/_ext/1807225790/UDP.o.d ${OBJECTDIR}/_ext/1807225790/Tick.o.d ${OBJECTDIR}/_ext/1807225790/IP.o.d ${OBJECTDIR}/_ext/1807225790/Helpers.o.d ${OBJECTDIR}/_ext/1807225790/StackTsk.o.d ${OBJECTDIR}/_ext/1807225790/ICMP.o.d ${OBJECTDIR}/_ext/1807225790/Delay.o.d ${OBJECTDIR}/_ext/1807225790/TCP.o.d ${OBJECTDIR}/_ext/1807225790/ETHPIC32IntMac.o.d ${OBJECTDIR}/_ext/1807225790/ETHPIC32ExtPhy.o.d ${OBJECTDIR}/ETHPIC32ExtPhyKSZ8051MLL.o.d ${OBJECTDIR}/StatusLEDs.o.d ${OBJECTDIR}/DMXKitty.o.d ${OBJECTDIR}/DMX.o.d ${OBJECTDIR}/Telnet.o.d ${OBJECTDIR}/Config.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1807225790/ARP.o ${OBJECTDIR}/_ext/1807225790/UDP.o ${OBJECTDIR}/_ext/1807225790/Tick.o ${OBJECTDIR}/_ext/1807225790/IP.o ${OBJECTDIR}/_ext/1807225790/Helpers.o ${OBJECTDIR}/_ext/1807225790/StackTsk.o ${OBJECTDIR}/_ext/1807225790/ICMP.o ${OBJECTDIR}/_ext/1807225790/Delay.o ${OBJECTDIR}/_ext/1807225790/TCP.o ${OBJECTDIR}/_ext/1807225790/ETHPIC32IntMac.o ${OBJECTDIR}/_ext/1807225790/ETHPIC32ExtPhy.o ${OBJECTDIR}/ETHPIC32ExtPhyKSZ8051MLL.o ${OBJECTDIR}/StatusLEDs.o ${OBJECTDIR}/DMXKitty.o ${OBJECTDIR}/DMX.o ${OBJECTDIR}/Telnet.o ${OBJECTDIR}/Config.o

# Source Files
SOURCEFILES=../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/ARP.c ../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/UDP.c ../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/Tick.c ../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/IP.c ../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/Helpers.c ../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/StackTsk.c ../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/ICMP.c ../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/Delay.c ../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/TCP.c ../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/ETHPIC32IntMac.c ../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/ETHPIC32ExtPhy.c ETHPIC32ExtPhyKSZ8051MLL.c StatusLEDs.c DMXKitty.c DMX.c Telnet.c Config.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/DMXKitty.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX664F128H
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1807225790/ARP.o: ../../microchip_solutions_v2012-04-03/Microchip/TCPIP\ Stack/ARP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1807225790 
	@${RM} ${OBJECTDIR}/_ext/1807225790/ARP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1807225790/ARP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1807225790/ARP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/_ext/1807225790/ARP.o.d" -o ${OBJECTDIR}/_ext/1807225790/ARP.o "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/ARP.c"   
	
${OBJECTDIR}/_ext/1807225790/UDP.o: ../../microchip_solutions_v2012-04-03/Microchip/TCPIP\ Stack/UDP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1807225790 
	@${RM} ${OBJECTDIR}/_ext/1807225790/UDP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1807225790/UDP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1807225790/UDP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/_ext/1807225790/UDP.o.d" -o ${OBJECTDIR}/_ext/1807225790/UDP.o "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/UDP.c"   
	
${OBJECTDIR}/_ext/1807225790/Tick.o: ../../microchip_solutions_v2012-04-03/Microchip/TCPIP\ Stack/Tick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1807225790 
	@${RM} ${OBJECTDIR}/_ext/1807225790/Tick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1807225790/Tick.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1807225790/Tick.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/_ext/1807225790/Tick.o.d" -o ${OBJECTDIR}/_ext/1807225790/Tick.o "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/Tick.c"   
	
${OBJECTDIR}/_ext/1807225790/IP.o: ../../microchip_solutions_v2012-04-03/Microchip/TCPIP\ Stack/IP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1807225790 
	@${RM} ${OBJECTDIR}/_ext/1807225790/IP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1807225790/IP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1807225790/IP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/_ext/1807225790/IP.o.d" -o ${OBJECTDIR}/_ext/1807225790/IP.o "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/IP.c"   
	
${OBJECTDIR}/_ext/1807225790/Helpers.o: ../../microchip_solutions_v2012-04-03/Microchip/TCPIP\ Stack/Helpers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1807225790 
	@${RM} ${OBJECTDIR}/_ext/1807225790/Helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1807225790/Helpers.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1807225790/Helpers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/_ext/1807225790/Helpers.o.d" -o ${OBJECTDIR}/_ext/1807225790/Helpers.o "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/Helpers.c"   
	
${OBJECTDIR}/_ext/1807225790/StackTsk.o: ../../microchip_solutions_v2012-04-03/Microchip/TCPIP\ Stack/StackTsk.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1807225790 
	@${RM} ${OBJECTDIR}/_ext/1807225790/StackTsk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1807225790/StackTsk.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1807225790/StackTsk.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/_ext/1807225790/StackTsk.o.d" -o ${OBJECTDIR}/_ext/1807225790/StackTsk.o "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/StackTsk.c"   
	
${OBJECTDIR}/_ext/1807225790/ICMP.o: ../../microchip_solutions_v2012-04-03/Microchip/TCPIP\ Stack/ICMP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1807225790 
	@${RM} ${OBJECTDIR}/_ext/1807225790/ICMP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1807225790/ICMP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1807225790/ICMP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/_ext/1807225790/ICMP.o.d" -o ${OBJECTDIR}/_ext/1807225790/ICMP.o "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/ICMP.c"   
	
${OBJECTDIR}/_ext/1807225790/Delay.o: ../../microchip_solutions_v2012-04-03/Microchip/TCPIP\ Stack/Delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1807225790 
	@${RM} ${OBJECTDIR}/_ext/1807225790/Delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1807225790/Delay.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1807225790/Delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/_ext/1807225790/Delay.o.d" -o ${OBJECTDIR}/_ext/1807225790/Delay.o "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/Delay.c"   
	
${OBJECTDIR}/_ext/1807225790/TCP.o: ../../microchip_solutions_v2012-04-03/Microchip/TCPIP\ Stack/TCP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1807225790 
	@${RM} ${OBJECTDIR}/_ext/1807225790/TCP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1807225790/TCP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1807225790/TCP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/_ext/1807225790/TCP.o.d" -o ${OBJECTDIR}/_ext/1807225790/TCP.o "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/TCP.c"   
	
${OBJECTDIR}/_ext/1807225790/ETHPIC32IntMac.o: ../../microchip_solutions_v2012-04-03/Microchip/TCPIP\ Stack/ETHPIC32IntMac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1807225790 
	@${RM} ${OBJECTDIR}/_ext/1807225790/ETHPIC32IntMac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1807225790/ETHPIC32IntMac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1807225790/ETHPIC32IntMac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/_ext/1807225790/ETHPIC32IntMac.o.d" -o ${OBJECTDIR}/_ext/1807225790/ETHPIC32IntMac.o "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/ETHPIC32IntMac.c"   
	
${OBJECTDIR}/_ext/1807225790/ETHPIC32ExtPhy.o: ../../microchip_solutions_v2012-04-03/Microchip/TCPIP\ Stack/ETHPIC32ExtPhy.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1807225790 
	@${RM} ${OBJECTDIR}/_ext/1807225790/ETHPIC32ExtPhy.o.d 
	@${RM} ${OBJECTDIR}/_ext/1807225790/ETHPIC32ExtPhy.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1807225790/ETHPIC32ExtPhy.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/_ext/1807225790/ETHPIC32ExtPhy.o.d" -o ${OBJECTDIR}/_ext/1807225790/ETHPIC32ExtPhy.o "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/ETHPIC32ExtPhy.c"   
	
${OBJECTDIR}/ETHPIC32ExtPhyKSZ8051MLL.o: ETHPIC32ExtPhyKSZ8051MLL.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/ETHPIC32ExtPhyKSZ8051MLL.o.d 
	@${RM} ${OBJECTDIR}/ETHPIC32ExtPhyKSZ8051MLL.o 
	@${FIXDEPS} "${OBJECTDIR}/ETHPIC32ExtPhyKSZ8051MLL.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/ETHPIC32ExtPhyKSZ8051MLL.o.d" -o ${OBJECTDIR}/ETHPIC32ExtPhyKSZ8051MLL.o ETHPIC32ExtPhyKSZ8051MLL.c   
	
${OBJECTDIR}/StatusLEDs.o: StatusLEDs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/StatusLEDs.o.d 
	@${RM} ${OBJECTDIR}/StatusLEDs.o 
	@${FIXDEPS} "${OBJECTDIR}/StatusLEDs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/StatusLEDs.o.d" -o ${OBJECTDIR}/StatusLEDs.o StatusLEDs.c   
	
${OBJECTDIR}/DMXKitty.o: DMXKitty.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/DMXKitty.o.d 
	@${RM} ${OBJECTDIR}/DMXKitty.o 
	@${FIXDEPS} "${OBJECTDIR}/DMXKitty.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/DMXKitty.o.d" -o ${OBJECTDIR}/DMXKitty.o DMXKitty.c   
	
${OBJECTDIR}/DMX.o: DMX.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/DMX.o.d 
	@${RM} ${OBJECTDIR}/DMX.o 
	@${FIXDEPS} "${OBJECTDIR}/DMX.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/DMX.o.d" -o ${OBJECTDIR}/DMX.o DMX.c   
	
${OBJECTDIR}/Telnet.o: Telnet.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/Telnet.o.d 
	@${RM} ${OBJECTDIR}/Telnet.o 
	@${FIXDEPS} "${OBJECTDIR}/Telnet.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/Telnet.o.d" -o ${OBJECTDIR}/Telnet.o Telnet.c   
	
${OBJECTDIR}/Config.o: Config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/Config.o.d 
	@${RM} ${OBJECTDIR}/Config.o 
	@${FIXDEPS} "${OBJECTDIR}/Config.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/Config.o.d" -o ${OBJECTDIR}/Config.o Config.c   
	
else
${OBJECTDIR}/_ext/1807225790/ARP.o: ../../microchip_solutions_v2012-04-03/Microchip/TCPIP\ Stack/ARP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1807225790 
	@${RM} ${OBJECTDIR}/_ext/1807225790/ARP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1807225790/ARP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1807225790/ARP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/_ext/1807225790/ARP.o.d" -o ${OBJECTDIR}/_ext/1807225790/ARP.o "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/ARP.c"   
	
${OBJECTDIR}/_ext/1807225790/UDP.o: ../../microchip_solutions_v2012-04-03/Microchip/TCPIP\ Stack/UDP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1807225790 
	@${RM} ${OBJECTDIR}/_ext/1807225790/UDP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1807225790/UDP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1807225790/UDP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/_ext/1807225790/UDP.o.d" -o ${OBJECTDIR}/_ext/1807225790/UDP.o "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/UDP.c"   
	
${OBJECTDIR}/_ext/1807225790/Tick.o: ../../microchip_solutions_v2012-04-03/Microchip/TCPIP\ Stack/Tick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1807225790 
	@${RM} ${OBJECTDIR}/_ext/1807225790/Tick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1807225790/Tick.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1807225790/Tick.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/_ext/1807225790/Tick.o.d" -o ${OBJECTDIR}/_ext/1807225790/Tick.o "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/Tick.c"   
	
${OBJECTDIR}/_ext/1807225790/IP.o: ../../microchip_solutions_v2012-04-03/Microchip/TCPIP\ Stack/IP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1807225790 
	@${RM} ${OBJECTDIR}/_ext/1807225790/IP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1807225790/IP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1807225790/IP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/_ext/1807225790/IP.o.d" -o ${OBJECTDIR}/_ext/1807225790/IP.o "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/IP.c"   
	
${OBJECTDIR}/_ext/1807225790/Helpers.o: ../../microchip_solutions_v2012-04-03/Microchip/TCPIP\ Stack/Helpers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1807225790 
	@${RM} ${OBJECTDIR}/_ext/1807225790/Helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1807225790/Helpers.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1807225790/Helpers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/_ext/1807225790/Helpers.o.d" -o ${OBJECTDIR}/_ext/1807225790/Helpers.o "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/Helpers.c"   
	
${OBJECTDIR}/_ext/1807225790/StackTsk.o: ../../microchip_solutions_v2012-04-03/Microchip/TCPIP\ Stack/StackTsk.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1807225790 
	@${RM} ${OBJECTDIR}/_ext/1807225790/StackTsk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1807225790/StackTsk.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1807225790/StackTsk.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/_ext/1807225790/StackTsk.o.d" -o ${OBJECTDIR}/_ext/1807225790/StackTsk.o "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/StackTsk.c"   
	
${OBJECTDIR}/_ext/1807225790/ICMP.o: ../../microchip_solutions_v2012-04-03/Microchip/TCPIP\ Stack/ICMP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1807225790 
	@${RM} ${OBJECTDIR}/_ext/1807225790/ICMP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1807225790/ICMP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1807225790/ICMP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/_ext/1807225790/ICMP.o.d" -o ${OBJECTDIR}/_ext/1807225790/ICMP.o "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/ICMP.c"   
	
${OBJECTDIR}/_ext/1807225790/Delay.o: ../../microchip_solutions_v2012-04-03/Microchip/TCPIP\ Stack/Delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1807225790 
	@${RM} ${OBJECTDIR}/_ext/1807225790/Delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1807225790/Delay.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1807225790/Delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/_ext/1807225790/Delay.o.d" -o ${OBJECTDIR}/_ext/1807225790/Delay.o "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/Delay.c"   
	
${OBJECTDIR}/_ext/1807225790/TCP.o: ../../microchip_solutions_v2012-04-03/Microchip/TCPIP\ Stack/TCP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1807225790 
	@${RM} ${OBJECTDIR}/_ext/1807225790/TCP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1807225790/TCP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1807225790/TCP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/_ext/1807225790/TCP.o.d" -o ${OBJECTDIR}/_ext/1807225790/TCP.o "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/TCP.c"   
	
${OBJECTDIR}/_ext/1807225790/ETHPIC32IntMac.o: ../../microchip_solutions_v2012-04-03/Microchip/TCPIP\ Stack/ETHPIC32IntMac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1807225790 
	@${RM} ${OBJECTDIR}/_ext/1807225790/ETHPIC32IntMac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1807225790/ETHPIC32IntMac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1807225790/ETHPIC32IntMac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/_ext/1807225790/ETHPIC32IntMac.o.d" -o ${OBJECTDIR}/_ext/1807225790/ETHPIC32IntMac.o "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/ETHPIC32IntMac.c"   
	
${OBJECTDIR}/_ext/1807225790/ETHPIC32ExtPhy.o: ../../microchip_solutions_v2012-04-03/Microchip/TCPIP\ Stack/ETHPIC32ExtPhy.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1807225790 
	@${RM} ${OBJECTDIR}/_ext/1807225790/ETHPIC32ExtPhy.o.d 
	@${RM} ${OBJECTDIR}/_ext/1807225790/ETHPIC32ExtPhy.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1807225790/ETHPIC32ExtPhy.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/_ext/1807225790/ETHPIC32ExtPhy.o.d" -o ${OBJECTDIR}/_ext/1807225790/ETHPIC32ExtPhy.o "../../microchip_solutions_v2012-04-03/Microchip/TCPIP Stack/ETHPIC32ExtPhy.c"   
	
${OBJECTDIR}/ETHPIC32ExtPhyKSZ8051MLL.o: ETHPIC32ExtPhyKSZ8051MLL.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/ETHPIC32ExtPhyKSZ8051MLL.o.d 
	@${RM} ${OBJECTDIR}/ETHPIC32ExtPhyKSZ8051MLL.o 
	@${FIXDEPS} "${OBJECTDIR}/ETHPIC32ExtPhyKSZ8051MLL.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/ETHPIC32ExtPhyKSZ8051MLL.o.d" -o ${OBJECTDIR}/ETHPIC32ExtPhyKSZ8051MLL.o ETHPIC32ExtPhyKSZ8051MLL.c   
	
${OBJECTDIR}/StatusLEDs.o: StatusLEDs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/StatusLEDs.o.d 
	@${RM} ${OBJECTDIR}/StatusLEDs.o 
	@${FIXDEPS} "${OBJECTDIR}/StatusLEDs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/StatusLEDs.o.d" -o ${OBJECTDIR}/StatusLEDs.o StatusLEDs.c   
	
${OBJECTDIR}/DMXKitty.o: DMXKitty.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/DMXKitty.o.d 
	@${RM} ${OBJECTDIR}/DMXKitty.o 
	@${FIXDEPS} "${OBJECTDIR}/DMXKitty.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/DMXKitty.o.d" -o ${OBJECTDIR}/DMXKitty.o DMXKitty.c   
	
${OBJECTDIR}/DMX.o: DMX.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/DMX.o.d 
	@${RM} ${OBJECTDIR}/DMX.o 
	@${FIXDEPS} "${OBJECTDIR}/DMX.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/DMX.o.d" -o ${OBJECTDIR}/DMX.o DMX.c   
	
${OBJECTDIR}/Telnet.o: Telnet.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/Telnet.o.d 
	@${RM} ${OBJECTDIR}/Telnet.o 
	@${FIXDEPS} "${OBJECTDIR}/Telnet.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/Telnet.o.d" -o ${OBJECTDIR}/Telnet.o Telnet.c   
	
${OBJECTDIR}/Config.o: Config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/Config.o.d 
	@${RM} ${OBJECTDIR}/Config.o 
	@${FIXDEPS} "${OBJECTDIR}/Config.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"/Users/sarahemm/microchip_solutions_v2012-04-03/Microchip/Include" -I"/Users/sarahemm/MPLABXProjects/DMXKitty.X" -MMD -MF "${OBJECTDIR}/Config.o.d" -o ${OBJECTDIR}/Config.o Config.c   
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/DMXKitty.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/DMXKitty.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,--defsym=_min_heap_size=3500,--gc-sections
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/DMXKitty.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/DMXKitty.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=3500,--gc-sections
	${MP_CC_DIR}/xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/DMXKitty.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
