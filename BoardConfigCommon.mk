#
# Copyright (C) 2015-2017 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

COMMON_PATH := device/motorola/msm8937-common

TARGET_RECOVERY_DEVICE_DIRS := \
    $(COMMON_PATH) \
    $(DEVICE_PATH)

# Architecture
TARGET_ARCH := arm64
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# Board
TARGET_BOARD_PLATFORM := msm8937
TARGET_BOOTLOADER_BOARD_NAME := MSM8937
TARGET_NO_BOOTLOADER := true

# Encryption
TARGET_HW_DISK_ENCRYPTION := true
TW_INCLUDE_CRYPTO := true

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom ehci-hcd.park=3 vmalloc=400M androidboot.bootdevice=7824900.sdhci movablecore=160M androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80000000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_KERNEL_LZ4C_DT := true
BOARD_KERNEL_SEPARATED_DT := true
KERNEL_TOOLCHAIN := $(PWD)/prebuilts/gcc/$(HOST_OS)-x86/aarch64/aarch64-linux-android-4.9/bin
TARGET_CUSTOM_DTBTOOL := dtbTool_custom
BOARD_DTBTOOL_ARGS := --force-v3 --motorola 1
KERNEL_TOOLCHAIN_PREFIX := aarch64-linux-androidkernel-
TARGET_KERNEL_SOURCE := kernel/motorola/msm8937

# Lun
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16879616    #    16484 * 1024 mmcblk0p38
LZMA_RAMDISK_TARGETS := recovery
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TW_INCLUDE_FUSE_EXFAT := true # exFAT support
TW_INCLUDE_FUSE_NTFS := true # NTFS support

# Qualcomm
BOARD_USES_QCOM_HARDWARE := true
TARGET_RECOVERY_QCOM_RTC_FIX := true

# Recovery
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/recovery/root/etc/twrp.fstab
RECOVERY_SDCARD_ON_DATA := true
BOARD_SUPPRESS_SECURE_ERASE := true

# TWRP
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TW_EXTRA_LANGUAGES := true
TW_NEW_ION_HEAP := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_THEME := portrait_hdpi
