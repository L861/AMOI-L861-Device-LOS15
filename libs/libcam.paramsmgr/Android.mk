# wrapper library for libcam.camadapter
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MULTILIB := both
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE            := libcam2paramsmgr
LOCAL_MODULE_OWNER = mtk
LOCAL_MODULE_SUFFIX = .so
LOCAL_SRC_FILES_64  := arm64/libcam2paramsmgr.so
LOCAL_SRC_FILES_32	:= arm/libcam2paramsmgr.so
include $(BUILD_PREBUILT)

#ifeq ($(USE_MTK_CAMERA_WRAPPER),true)
include $(CLEAR_VARS)

LOCAL_SRC_FILES += \
	ParamsManager.update.cpp \
#	ParamsManager.cpp \
#	Map.cpp \
#	ParamsManager.check.cpp \

LOCAL_C_INCLUDES += system/core/libutils/include
LOCAL_C_INCLUDES += frameworks/native/libs/nativebase/include
LOCAL_C_INCLUDES += $(DEVICE_PATH)/hal/libcamera_client_mtk/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/inc
LOCAL_C_INCLUDES += $(LOCAL_PATH)

LOCAL_REQUIRED_MODULES += libcam2paramsmgr

LOCAL_CPPFLAGS += -fexceptions -Wno-missing-declarations

LOCAL_CFLAGS += -fno-stack-protector -Wno-missing-declarations
LOCAL_LDLIBS := -lcutils -lcam2paramsmgr

#LOCAL_STATIC_LIBRARIES := libcamera_client_mtk

LOCAL_SHARED_LIBRARIES := liblog libutils libcutils libdl libbinder libcam_utils libcamera_client

LOCAL_MODULE := libcam.paramsmgr
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
#endif
