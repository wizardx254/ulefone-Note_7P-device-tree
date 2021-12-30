
DEVICE_PATH := device/ulefone/Note_7P

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# Assert
TARGET_OTA_ASSERT_DEVICE := Note_7P

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432 # This is the maximum known partition size, but it can be higher, so we just omit it
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 buildvariant=user androidboot.selinux=permissive buildvariant=user
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x11a88000
BOARD_KERNEL_TAGS_OFFSET := 0x07808000
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
#TARGET_KERNEL_ARCH := arm64
#TARGET_KERNEL_HEADER_ARCH := arm64
#TARGET_KERNEL_SOURCE := kernel/ulefone/Note_7P
#TARGET_KERNEL_CONFIG := Note_7P_defconfig

# AVB
#BOARD_AVB_ENABLE := true
#BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)

# Platform
TARGET_BOARD_PLATFORM := mt6761

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true


# Resolution
DEVICE_SCREEN_WIDTH := 600
DEVICE_SCREEN_HEIGHT := 1280

# Decryption
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
USE_FSCRYPT := true
TARGET_HW_DISK_ENCRYPTION := false
BOARD_USES_MTK_HARDWARE := true
#TW_DEVICE_VERSION := 
TW_INCLUDE_NTFS_3G := true
TW_HAS_MTP := true
TW_DEFAULT_DEVICE_NAME := Note_7P
#TW_DEFAULT_LANGUAGE := ru
#TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_EXCLUDE_TWRPAPP := true
TW_INCLUDE_REPACKTOOLS := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TARGET_USES_MKE2FS := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
# system.prop
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/build.prop



#TW_RECOVERY_ADDITIONAL_RELINK_FILES += \
   # $(TARGET_OUT_VENDOR_EXECUTABLES)/hw/android.hardware.drm@1.1-service.clearkey \
   # $(TARGET_OUT_VENDOR_EXECUTABLES)/hw/android.hardware.drm@1.0-service \
   # $(TARGET_OUT_VENDOR_EXECUTABLES)/hw/vendor.microtrust.hardware.capi@2.0-service \
   # $(TARGET_OUT_VENDOR_EXECUTABLES)/hw/vendor.sw.swfingerprint@1.0-service

# NOTE:
# Don't use '-' or blank spaces in flag values!
# These will create build errors or other bugs in recovery (Excluding SHRP_PATH,SHRP_REC).
#
# NOTE-2:
# all values within these brackets: "<" ">" showing choice values and need to be
# replaced by you with the correct values!
# Example: if the codename of your device is "gtexslte" <device-codename> becomes:
# SHRP_DEVICE_CODE := gtexslte
# (so without any brackets ofc!)

################### ############################################
# MANDATORY FLAGS # These flags HAVE TO be set/changed by you! #
################### ############################################

# Device codename
# Default (if not set): N/A
SHRP_DEVICE_CODE := Note_7P

# Path of your SHRP device tree
# Replace <device-brand> with the device brand name
# (SHRP_DEVICE_CODE will expand to the above variable so check if that is correct)
SHRP_PATH := device/ulefone/Note_7P

# Maintainer name
# Default (if not set): N/A
SHRP_MAINTAINER := LARRISON_EGESA_WASIKE

# Recovery Type (for "About" section only)
# Default (if not set): N/A
SHRP_REC_TYPE := Treble

# Device Type (for "About" section only)
# Default (if not set): N/A
SHRP_DEVICE_TYPE := A_Only

# Your device's recovery path, dont use blindly
# No default
SHRP_REC := /dev/block/bootdevice/by-name/recovery

################### ################################################################################
# IMPORTANT FLAGS # These are usually good to check - at least if the defaults are what you expect #
################### ################################################################################

# Emergency DownLoad mode (0 = no EDL mode, 1 = EDL mode available)
# Default (if not set): 0
SHRP_EDL_MODE := 0

# internal storage path
# Default (if not set): /sdcard
SHRP_INTERNAL := /sdcard

# If your device has an external sdcard
# Default (if not set): /
SHRP_EXTERNAL := /external_sd

# USB OTG path
# Default (if not set): /
SHRP_OTG := /usb_otg

# Flashlight: (0 = disable, 1 = enable)
# Default (if not set): 0
SHRP_FLASH := 1

################## #########################################################################
# OPTIONAL FLAGS # Stuff which highly depends on your device and / or personal preferences #
################## #########################################################################

# Use this flag only if your device is A/B.
# Default (if not set) is no A/B device
# Set this variable when true ONLY (do not use "false" or similiar)
SHRP_AB := false

# SHRP padding flag (for rounded corner devices only)
# You have to change these values according to your device's roundness.
#SHRP_STATUSBAR_RIGHT_PADDING := <1-XXX>
# Default (for LEFT): 20
#SHRP_STATUSBAR_LEFT_PADDING := <1-XXX>

# For notch devices
# Default (if not set) is no notch
# Set this variable when true ONLY (do not use "false" or similiar)
SHRP_NOTCH := true

# SHRP Express, enables on-the-fly theme patching (also persistent) + persistent lock
# Default (if not set) is not using Express
# Set this variable when true ONLY (do not use "false" or similiar)
SHRP_EXPRESS := true

# SHRP Express use Data save shrp files inside /data instead of /system
# Note - SHRP_EXPRESS must be true to use this flag otherwise it won't work.
# Default (if not set) will use /system if SHRP_EXPRESS true otherwise will use legacy method of patching
# Set this variable when true ONLY (do not use "false" or similiar)
SHRP_EXPRESS_USE_DATA := true

# SHRP Dark mode, use this flag to have dark theme set by default
# Default (if not set) is not using DARK mode
# Set this variable when true ONLY (do not use "false" or similiar)
SHRP_DARK := true

# custom led paths for flashlight
# find yours then replace the examples here
SHRP_CUSTOM_FLASHLIGHT := true
#SHRP_FONP_1 := /sys/class/leds/led:torch_0/brightness
#SHRP_FONP_2 := /sys/class/leds/led:torch_1/brightness
#SHRP_FONP_3 := /sys/class/leds/led:switch/brightness
SHRP_FONP_4 := /dev/flashlight

# Max brightness of flashlight
# you can also check the above led paths in Android when you turn on flashlight
SHRP_FLASH_MAX_BRIGHTNESS := 255

# OFFICIAL
SHRP_OFFICIAL := true