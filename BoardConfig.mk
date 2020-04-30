#
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm6250-common
-include device/xiaomi/sm6250-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/curtana

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a9
TARGET_USES_64_BIT_BINDER := true

# Screen density
TARGET_SCREEN_DENSITY := 400

# Assert
TARGET_OTA_ASSERT_DEVICE := curtana

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sm7125
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := sm7125
TARGET_BOARD_PLATFORM_GPU := qcom-adreno618

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := false
      WITH_DEXPREOPT := true
    endif
  endif
endif

# Kernel [TODO - make enforcing/source built ]
BOARD_KERNEL_BASE := 0x80000000
TARGET_KERNEL_ARCH := arm64
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=1
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset=0x01000000
BOARD_MKBOOTIMG_ARGS := --tags_offset=0x00000100
BOARD_KERNEL_CMDLINE := androidboot.selinux.permissive
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x01000000
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
TARGET_KERNEL_VERSION := 4.14

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml

# SELinux
include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Vendor security patch level
VENDOR_SECURITY_PATCH := 2020-02-01

# Inherit proprietary blobs
-include vendor/xiaomi/curtana/BoardConfigVendor.mk
