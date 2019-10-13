LOCAL_PATH := $(call my-dir)

$(info [DRM Widevine] copying DRM blob)

include $(CLEAR_VARS)
LOCAL_MODULE := libteec.so
LOCAL_MODULE_OWNER := mtk
LOCAL_SRC_FILES_32 := vendor/lib/libteec.so
LOCAL_SRC_FILES_64 := vendor/lib64/libteec.so
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_DEX_PREOPT := false
LOCAL_MULTILIB := both
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libtlcWidevineModularDrm.so
LOCAL_MODULE_OWNER := mtk
LOCAL_SRC_FILES_32 := vendor/lib/libtlcWidevineModularDrm.so
LOCAL_SRC_FILES_64 := vendor/lib64/libtlcWidevineModularDrm.so
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_DEX_PREOPT := false
LOCAL_MULTILIB := both
include $(BUILD_PREBUILT)



include $(CLEAR_VARS)
LOCAL_MODULE := libwvhidl.so
LOCAL_MODULE_OWNER := mtk
LOCAL_SRC_FILES_32 := vendor/lib/libwvhidl.so
LOCAL_SRC_FILES_64 := vendor/lib64/libwvhidl.so
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_DEX_PREOPT := false
#LOCAL_MODULE_PATH  := $(TARGET_OUT)/vendor/lib
LOCAL_MULTILIB = both
#LOCAL_PRIVILEGED_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := android.hardware.drm@1.0-service.widevine.rc
LOCAL_MODULE_OWNER := mtk
LOCAL_SRC_FILES := vendor/etc/init/android.hardware.drm@1.0-service.widevine.rc
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_PATH  := $(TARGET_OUT)/vendor/etc/init
LOCAL_PRIVILEGED_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_REQUIRED_MODULES := \
	android.hardware.drm@1.0-service.widevine.rc \
	libwvhidl.so \
	libteec.so \
#	liboemcrypto \
#	libtlcWidevineModularDrm.so \
#	libWVStreamControlAPI_L$(BOARD_WIDEVINE_OEMCRYPTO_LEVEL) \
#	libdrmwvmplugin_L$(BOARD_WIDEVINE_OEMCRYPTO_LEVEL) \
#	libwvdrm_L$(BOARD_WIDEVINE_OEMCRYPTO_LEVEL) \
#	com.google.widevine.software.drm.xml \
#	com.google.widevine.software.drm \
#	libdrmdecrypt \
#	libwvsecureos_api \
	
	
LOCAL_MODULE := android.hardware.drm@1.0-service.widevine
LOCAL_MODULE_OWNER := mtk
LOCAL_SRC_FILES := vendor/bin/hw/android.hardware.drm@1.0-service.widevine
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := BIN
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_PATH  := $(TARGET_OUT)/vendor/bin/hw
LOCAL_PRIVILEGED_MODULE := true
include $(BUILD_PREBUILT)



