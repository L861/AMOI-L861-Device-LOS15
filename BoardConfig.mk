-include vendor/openstone/L861/BoardConfigVendor.mk

DEVICE_PATH := device/openstone/L861

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include
TARGET_BOARD_KERNEL_HEADERS := $(DEVICE_PATH)/kernel-headers

MTK_K64_SUPPORT := yes
#USE_CAMERA_STUB := true
# debug native crahses sample
# addr2line -C -f -e obj/SHARED_LIBRARIES/libutils_intermediates/libutils.so.debug 0000000000011088
#
#

#DRM
MTK_WVDRM_L1_SUPPORT := yes
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 3


ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_NO_BOOTLOADER := true

TARGET_BOARD_PLATFORM := mt6795
MTK_PLATFORM := mt6795
# TARGET_LDPRELOAD := libmtk_symbols.so

TARGET_KERNEL_HAVE_EXFAT := true
TARGET_KERNEL_HAVE_NTFS := true

#FIX Firmware moved to /vendor
#BOARD_ROOT_EXTRA_SYMLINKS += /system/etc/permissions:../system/vendor/etc/permissions
BOARD_ROOT_EXTRA_SYMLINKS += /system/vendor/etc/.tp:../system/etc/.tp
BOARD_ROOT_EXTRA_SYMLINKS += /system/vendor/etc/firmware:../system/etc/firmware
BOARD_ROOT_EXTRA_SYMLINKS += /system/vendor/etc/mddb:../system/etc/mddb
BOARD_ROOT_EXTRA_SYMLINKS += /system/vendor/etc/hostapd:../system/etc/hostapd
BOARD_ROOT_EXTRA_SYMLINKS += /system/vendor/etc/audio:../system/etc/audio
BOARD_ROOT_EXTRA_SYMLINKS += /system/vendor/etc/audio_param:../system/etc/audio_param
BOARD_ROOT_EXTRA_SYMLINKS += /system/vendor/etc/wifi:../system/etc/wifi
BOARD_ROOT_EXTRA_SYMLINKS += /system/vendor/etc/radvd:../system/etc/radvd
BOARD_ROOT_EXTRA_SYMLINKS += /system/vendor/etc/nvc_conformance:../system/etc/nfc_conformance

# CPU
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_SMP := true
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Add VOLTE Support
#MTK_VOLTE_SUPPORT := yes
#ART_BOOT_IMAGE_EXTRA_ARGS=--runtime-arg -verbose:verifier

# FIX Freezing
TARGET_NO_SENSOR_PERMISSION_CHECK := true
BOARD_GLOBAL_CFLAGS += -DNO_SENSOR_PERMISSION_CHECK -DMTK_PLATFORM=mt6795
BOARD_GLOBAL_CPPFLAGS += -DNO_SENSOR_PERMISSION_CHECK -DMTK_PLATFORM=mt6795

#TARGET_REQUIRES_SYNCHRONOUS_SETSURFACE := true

# BOOTLOADER
TARGET_BOOTLOADER_BOARD_NAME := mt6795

# EXT4
TARGET_USERIMAGES_USE_EXT4 := true
#TARGET_USERIMAGES_USE_F2FS := true

# MTK Hardware
BOARD_USES_MTK_HARDWARE := true
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true
TARGET_KMODULES := true



BOARD_GLOBAL_CFLAGS += -DMTK_HARDWARE -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
BOARD_GLOBAL_CFLAGS += -DCOMPAT_SENSORS_M
BOARD_GLOBAL_CFLAGS += -DMTK_HARDWARE
BOARD_GLOBAL_CPPFLAGS += -DMTK_HARDWARE
BOARD_GLOBAL_CPPFLAGS += -DCOMPAT_SENSORS_M
BOARD_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
BOARD_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING
#BOARD_GLOBAL_CFLAGS += -DCAMERA_VENDOR_L_COMPAT // not use for MTK!!!
BOARD_GLOBAL_CFLAGS += -DDECAY_TIME_DEFAULT=0
BOARD_DISABLE_HW_ID_MATCH_CHECK := true
#
BOARD_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK


#TARGET_DOES_NOT_SUPPORT_SECCOMP := true

#Sensors
#USE_SENSOR_MULTI_HAL := true 
#PRODUCT_FULL_TREBLE := false

# Kernel
TARGET_USES_64_BIT_BINDER := true
TARGET_IS_64_BIT := true
# androidboot.selinux=permissive androidboot.dm_verity=disabled androidboot.hardware=freescale
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=enforcing
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048

	
TARGET_KERNEL_SOURCE := kernel/openstone/L861
TARGET_KERNEL_CONFIG := los15_defconfig

TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-

#TARGET_KERNEL_CROSS_COMPILE_PREFIX :=/usr/src/android/gcc-linaro-4.9.4-2017.01-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_MKBOOTIMG_ARGS := --base 0x40078000 --pagesize 2048 --kernel_offset 0x00008000 --ramdisk_offset 0x03f88000 --second_offset 0x00f00000 --tags_offset 0x0df88000 --board MT6795

# build old-style zip files (required for ota updater)
BLOCK_BASED_OTA := false

# Disable memcpy opt (for audio libraries)
TARGET_CPU_MEMCPY_OPT_DISABLE := true

# Display
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(DEVICE_PATH)/configs/egl.cfg
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440
BOARD_EGL_WORKAROUND_BUG_10194508 := true
BOARD_EGL_NEEDS_HANDLE_VALUE := true
VSYNC_EVENT_PHASE_OFFSET_NS := -8000000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := -8000000
PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 0
#SF_START_GRAPHICS_ALLOCATOR_SERVICE := true


# MTK PATHS
MTK_STATIC_LIBRARY := $(BUILD_STATIC_LIBRARY)
MTK_SHARED_LIBRARY := $(BUILD_SHARED_LIBRARY)
MTK_ROOT := vendor/mediatek/proprietary
MTK_PATH_SOURCE := vendor/mediatek/proprietary
MTK_PATH_PLATFORM := $(TOP)/vendor/mediatek/proprietary
MTK_PLATFORM_DIR := mt6795

#MTK_BASIC_PACKAGE := yes


# HW Composer
MTK_HWC_SUPPORT := yes
MTK_HWC_VERSION := 1.4.0
MAX_VIRTUAL_DISPLAY_DIMENSION := 4096
MTK_HDMI_SUPPORT := yes
#TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MTK_SEC_VIDEO_PATH_SUPPORT := yes
MTK_ROTATION_OFFSET_SUPPORT := yes
#TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
#MTK_BASIC_PACKAGE := yes


# Support of MTK NFC
#TARGET_USES_NQ_NFC := true
MTK_NFC_SUPPORT := yes
MTK_NFC_HAL := MTK
#MTK_BSP_PACKAGE := yes

#Software gatekeeper
BOARD_USE_SOFT_GATEKEEPER := true

# LightHAL
TARGET_PROVIDES_LIBLIGHT := false

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

#FM Radio

#FM

BOARD_HAVE_ALTERNATE_FM := true
MTK_FM_SUPPORT := yes
MTK_FM_RX_SUPPORT :=yes
MTK_FM_CHIP := MT6630_FM
MTK_FM_RX_AUDIO := FM_DIGITAL_INPUT
MTK_FM_TX_AUDIO := FM_DIGITAL_OUTPUT
MTK_FM_TX_SUPPORT := no
FM_RAIDO_BAND := 1
MTK_FMRADIO_APP := yes
MTK_FM_50KHZ_SUPPORT := no
MTK_FM_RECORDING_SUPPORT := yes
MTK_FM_SHORT_ANTENNA_SUPPORT := yes

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Audio
BOARD_USES_MTK_AUDIO := true
#LEGACY_MTK_AV_BLOB := true
BOARD_CONNECTIVITY_VENDOR := MediaTek
SUPPRESS_MTK_AUDIO_BLOB_ERR_MSG := true
USE_XML_AUDIO_POLICY_CONF := 1
BUILD_WITH_ALSA_UTILS := true
#BOARD_USES_LEGACY_ALSA := true




# RIL
SIM_COUNT := 1
BOARD_PROVIDES_RILD := true
BOARD_PROVIDES_LIBRIL := true
#MTK_MUX_CHANNEL := 64


BOARD_CONNECTIVITY_VENDOR := MediaTek
BOARD_CONNECTIVITY_MODULE := conn_soc


# Display
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
#TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

TARGET_HAS_WIDE_COLOR_DISPLAY := false
TARGET_HAS_HDR_DISPLAY := false
TARGET_USES_COLOR_METADATA := false


# LineageHW
BOARD_USES_LINEAGE_HARDWARE := true
BOARD_HARDWARE_CLASS := $(DEVICE_PATH)/lineagehw
#TARGET_TAP_TO_WAKE_NODE := "/sys/bus/i2c/devices/i2c-2/2-004b/wake_gesture_enable"
TARGET_TAP_TO_WAKE_NODE := /proc/gt9xx_gesture

# Wifi
BOARD_WLAN_DEVICE := MediaTek
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_P2P := P2P
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_STATE_ON := 1
WIFI_DRIVER_STATE_OFF := 0

# Fix video autoscaling on old OMX decoders
TARGET_OMX_LEGACY_RESCALING:= true

# Bluetooth
MTK_BT_SUPPORT := yes
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
MTK_MERGE_INTERFACE_SUPPORT := yes
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# GPS
BOARD_GPS_LIBRARIES := true
BOARD_MEDIATEK_USES_GPS := true
MTK_GPS_SUPPORT := yes
MTK_GPS_CHIP :=  MTK_GPS_MT6630


# make_ext4fs requires numbers in dec format
#BOARD_HAS_LARGE_FILESYSTEM := true
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
#BOARD_CACHEIMAGE_PARTITION_SIZE := 444596224
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 27992260608
#BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
#BOARD_FLASH_BLOCK_SIZE := 4096

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true
# BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
# BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
# BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1887436800
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 13474725888
BOARD_USERDATAIMAGE_PARTITION_SIZE := 28415885312
#BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_CACHEIMAGE_PARTITION_SIZE := 838860800
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072


# LZMA compression for ramdisk
LZMA_RAMDISK_TARGETS += recovery 

#TARGET_NOT_USE_GZIP_RECOVERY_RAMDISK := true


WITH_TWRP := true
RECOVERY_VARIANT := twrp

# Recovery
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
ifeq ($(WITH_TWRP),true)
TW_NO_MINUI_CUSTOM_FONTS := true
TW_USE_NEW_MINIADBD := true
TW_USE_TOOLBOX := true
DEVICE_RESOLUTION := 2560x1440
DEVICE_SCREEN_WIDTH := 2560
DEVICE_SCREEN_HEIGHT := 1440
TW_EXCLUDE_SUPERSU := true
TW_OEM_BUILD := false
TWRP_INCLUDE_LOGCAT := true
TWHAVE_SELINUX := false
#TARGET_PREBUILT_RECOVERY_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
DEVICE_RESOLUTION := 2560x1440
DEVICE_SCREEN_WIDTH := 2560
DEVICE_SCREEN_HEIGHT := 1440
#TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/bus.2/11270000.USB3/musb-hdrc/gadget/lun0/file
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"
BOARD_HAS_NO_SELECT_BUTTON := true
#TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp
TW_CUSTOM_BATTERY_PATH := /sys/class/power_supply/battery
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_MAX_BRIGHTNESS := 255
BOARD_SUPPRESS_SECURE_ERASE := true
TW_INCLUDE_CRYPTO := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/userdata" # i think this isn't used anymore
#TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/mtk-msdc.0/by-name/userdata"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,noatime,discard,noauto_da_alloc,data =ordered"
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 152
#TW_SCREEN_TIMEOUT_SECS := 240
TW_NO_SCREEN_TIMEOUT := 1
#TW_NO_USB_STORAGE := true
#TW_NO_BATT_PERCENT := true
BOARD_USE_FRAMEBUFFER_ALPHA_CHANNEL := true
TARGET_DISABLE_TRIPLE_BUFFERING := false
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/ramdisk/twrp.fstab
else
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/ramdisk/fstab.mt6795
endif



TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_USE_FRAMEBUFFER_ALPHA_CHANNEL := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_DISABLE_TRIPLE_BUFFERING := false
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"

# system.prop
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# Legacy blobs
TARGET_NEEDS_TEXT_RELOCATIONS := true

# Camera
# USE_CAMERA_STUB := true
CAMERA_HARDWARE_MODULE_ID := camera
BOARD_NUMBER_OF_CAMERAS := 2
MAX_CAMERAS := 2
BOARD_USES_LEGACY_MTK_AV_BLOB := true



# Shims
#TARGET_LD_SHIM_LIBS := \
#/system/vendor/lib/hw/hwcomposer.mt6795.so|libmtk_symbols.so:\
#/system/vendor/lib64/hw/hwcomposer.mt6795.so|libmtk_symbols.so:\

# libcam.utils.sensorlistener
TARGET_LD_SHIM_LIBS := \
/system/vendor/lib/libcam.utils.sensorlistener.so|libSensorslistener_shim.so:\
/system/vendor/lib64/libcam.utils.sensorlistener.so|libSensorslistener_shim.so:\
/system/vendor/lib/libmmsdkservice.feature.so|libmtk_symbols.so:\
/system/vendor/lib64/libmmsdkservice.feature.so|libmtk_symbols.so:\
/system/vendor/lib/libMtkOmxVenc.so|libmtk_symbols.so:\
/system/vendor/lib/libgem.so|libmtk_symbols.so:\
/system/vendor/lib64/libgem.so|libmtk_symbols.so:\
#/system/vendor/lib/libMtkOmxVdecEx.so|libmtk_symbols.so:\
#/system/lib/libsensorservice.so|libSensorslistener_shim.so:\
#/system/lib64/libsensorservice.so|libSensorslistener_shim.so:\
#/system/vendor/lib/libcam.paramsmgr.so|libcam.paramsmgr.shim.so:\
#/system/vendor/lib64/libcam.paramsmgr.so|libcam.paramsmgr.shim.so:\
#/system/vendor/lib/libcam.client.so|libmtk_symbols.so:\
#/system/vendor/lib64/libcam.client.so|libmtk_symbols.so:\
#/system/vendor/lib/libcam.client.so|libcam_shim.so:\
#/system/vendor/lib64/libcam.client.so|libcam_shim.so:\

# USE_LEGACY_LOCAL_AUDIO_HAL := true
# TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_CAMERASERVICE_CLOSES_NATIVE_HANDLES := true
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_USES_MEDIA_EXTENSIONS := true
TARGET_NEEDS_LEGACY_CAMERA_HAL1_DYN_NATIVE_HANDLE := true
USE_MTK_CAMERA_WRAPPER := true
TARGET_USES_NON_TREBLE_CAMERA := true
#MTK_MMPROFILE_SUPPORT := yes
TARGET_USE_COMPAT_GRALLOC_ALIGN := true


#TARGET_HAS_LEGACY_CAMERA_HAL1 := true
#TARGET_NEEDS_LEGACY_CAMERA_HAL1_DYN_NATIVE_HANDLE := true
TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY := libcamera_client_mtk
#TARGET_CAMERASERVICE_CLOSES_NATIVE_HANDLES := true
#TARGET_USES_NON_TREBLE_CAMERA := true
#TARGET_USE_COMPAT_GRALLOC_ALIGN := true
#USE_DEVICE_SPECIFIC_CAMERA := true
#USE_MTK_CAMERA_WRAPPER := true 
#TARGET_USES_HWC2 := true

# Charger


#WITH_LINEAGE_CHARGER := true
#BOARD_HAL_STATIC_LIBRARIES := libhealthd.lineage
TARGET_RECOVERY_DENSITY := xhdpi
#BOARD_CHARGER_NO_UI := true
 

# Offline charging
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/BOOT/BOOT/boot/boot_mode
#BOARD_HEALTHD_CUSTOM_CHARGER_RES := vendor/lineage/charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness
BOARD_RED_LED_PATH := "/sys/class/leds/red"
BOARD_GREEN_LED_PATH := "/sys/class/leds/green"
RED_LED_PATH := /sys/class/leds/red/brightness
GREEN_LED_PATH := /sys/class/leds/green/brightness
CHARGING_ENABLED_PATH := /sys/class/power_supply/battery/charging_enabled
BACKLIGHT_PATH  := /sys/class/leds/lcd-backlight/brightness
HEALTHD_BACKLIGHT_LEVEL := 30


# HIDL Manifest
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/configs/manifest.xml

# Selinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy
#BOARD_SEPOLICY_VERS := 28.0

# Treble
PRODUCT_FULL_TREBLE := false

#SELINUX_IGNORE_NEVERALLOWS := true

# Deodex
#WITH_DEXPREOPT := false
#DISABLE_DEXPREOPT := true

