#
# Copyright (c) 2011 Atmel Corporation. All rights reserved.
#
# \asf_license_start
#
# \page License
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice,
#    this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# 3. The name of Atmel may not be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
# 4. This software may only be redistributed and used in connection with an
#    Atmel microcontroller product.
#
# THIS SOFTWARE IS PROVIDED BY ATMEL "AS IS" AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT ARE
# EXPRESSLY AND SPECIFICALLY DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR
# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
# STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# \asf_license_stop
#

# Path to top level ASF directory relative to this project directory.
PRJ_PATH = ../../../../../../..

# Target CPU architecture: cortex-m3, cortex-m4
ARCH = cortex-m0plus

# Target part: none, sam3n4 or sam4l4aa
PART = saml21j18b

# Application target name. Given with suffix .a for library and .elf for a
# standalone application.
TARGET_FLASH = winc1500_firmware_update_project_flash.elf
TARGET_SRAM = winc1500_firmware_update_project_sram.elf

# List of C source files.
CSRCS = \
       common/components/wifi/winc1500/firmware_update_project/main.c \
       common/utils/interrupt/interrupt_sam_nvic.c        \
       sam0/boards/saml21_xplained_pro_b/board_init.c     \
       sam0/drivers/port/port.c                           \
       sam0/drivers/system/pinmux/pinmux.c                \
       sam0/utils/cmsis/saml21/source/gcc/startup_saml21.c \
       sam0/utils/cmsis/saml21/source/system_saml21.c     \
       sam0/utils/syscalls/gcc/syscalls.c

# List of assembler source files.
ASSRCS = 

# List of include paths.
INC_PATH = \
       common/boards                                      \
       common/components/wifi/winc1500/firmware_update_project \
       common/components/wifi/winc1500/firmware_update_project/doc \
       common/components/wifi/winc1500/firmware_update_project/firmware \
       common/components/wifi/winc1500/firmware_update_project/firmware/Tools \
       common/components/wifi/winc1500/firmware_update_project/firmware/Tools/flash-tools \
       common/components/wifi/winc1500/firmware_update_project/firmware/Tools/gain_builder \
       common/components/wifi/winc1500/firmware_update_project/firmware/Tools/gain_builder/gain_sheets \
       common/components/wifi/winc1500/firmware_update_project/firmware/Tools/root_certificate_downloader \
       common/components/wifi/winc1500/firmware_update_project/firmware/Tools/root_certificate_downloader/binary \
       common/components/wifi/winc1500/firmware_update_project/firmware/Tools/serial_bridge \
       common/components/wifi/winc1500/firmware_update_project/firmware/ate_firmware \
       common/components/wifi/winc1500/firmware_update_project/firmware/boot_firmware \
       common/components/wifi/winc1500/firmware_update_project/firmware/boot_firmware/release3A0 \
       common/components/wifi/winc1500/firmware_update_project/firmware/downloader_firmware \
       common/components/wifi/winc1500/firmware_update_project/firmware/downloader_firmware/release3A0 \
       common/components/wifi/winc1500/firmware_update_project/firmware/firmware \
       common/components/wifi/winc1500/firmware_update_project/firmware/firmware/wifi_v111 \
       common/components/wifi/winc1500/firmware_update_project/firmware/firmware/wifi_v111/ASIC_3A0 \
       common/components/wifi/winc1500/firmware_update_project/firmware/ota_firmware \
       common/components/wifi/winc1500/firmware_update_project/firmware/programmer_firmware \
       common/components/wifi/winc1500/firmware_update_project/firmware/programmer_firmware/release3A0 \
       common/components/wifi/winc1500/firmware_update_project/firmware/provisioning_webpage \
       common/components/wifi/winc1500/firmware_update_project/firmware/tls_cert_store \
       common/components/wifi/winc1500/firmware_update_project/firmware/tls_cert_store/CA \
       common/components/wifi/winc1500/firmware_update_project/saml21j18b_saml21_xplained_pro_b \
       common/utils                                       \
       sam0/boards                                        \
       sam0/boards/saml21_xplained_pro_b                  \
       sam0/drivers/port                                  \
       sam0/drivers/system/pinmux                         \
       sam0/utils                                         \
       sam0/utils/cmsis/saml21/include_b                  \
       sam0/utils/cmsis/saml21/source                     \
       sam0/utils/header_files                            \
       sam0/utils/preprocessor                            \
       thirdparty/CMSIS/Include                           \
       thirdparty/CMSIS/Lib/GCC \
       common/components/wifi/winc1500/firmware_update_project/saml21j18b_saml21_xplained_pro_b/gcc

# Additional search paths for libraries.
LIB_PATH =  \
       thirdparty/CMSIS/Lib/GCC                          

# List of libraries to use during linking.
LIBS =  \
       arm_cortexM0l_math                                

# Path relative to top level directory pointing to a linker script.
LINKER_SCRIPT_FLASH = sam0/utils/linker_scripts/saml21/gcc/saml21j18b_flash.ld
LINKER_SCRIPT_SRAM  = sam0/utils/linker_scripts/saml21/gcc/saml21j18b_sram.ld

# Path relative to top level directory pointing to a linker script.
DEBUG_SCRIPT_FLASH = sam0/boards/saml21_xplained_pro_b/debug_scripts/gcc/saml21_xplained_pro_flash.gdb
DEBUG_SCRIPT_SRAM  = sam0/boards/saml21_xplained_pro_b/debug_scripts/gcc/saml21_xplained_pro_sram.gdb

# Project type parameter: all, sram or flash
PROJECT_TYPE        = flash

# Additional options for debugging. By default the common Makefile.in will
# add -g3.
DBGFLAGS = 

# Application optimization used during compilation and linking:
# -O0, -O1, -O2, -O3 or -Os
OPTIMIZATION = -O1

# Extra flags to use when archiving.
ARFLAGS = 

# Extra flags to use when assembling.
ASFLAGS = 

# Extra flags to use when compiling.
CFLAGS = 

# Extra flags to use when preprocessing.
#
# Preprocessor symbol definitions
#   To add a definition use the format "-D name[=definition]".
#   To cancel a definition use the format "-U name".
#
# The most relevant symbols to define for the preprocessor are:
#   BOARD      Target board in use, see boards/board.h for a list.
#   EXT_BOARD  Optional extension board in use, see boards/board.h for a list.
CPPFLAGS = \
       -D ARM_MATH_CM0PLUS=true                           \
       -D BOARD=SAML21_XPLAINED_PRO                       \
       -D __SAML21J18B__

# Extra flags to use when linking
LDFLAGS = \

# Pre- and post-build commands
PREBUILD_CMD = 
POSTBUILD_CMD = 