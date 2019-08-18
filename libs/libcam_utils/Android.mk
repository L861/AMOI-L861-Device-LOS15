# wrapper library for libcam.camadapter
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MULTILIB := both
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE            := libcam2utils
LOCAL_MODULE_OWNER = mtk
LOCAL_MODULE_SUFFIX = .so
LOCAL_SRC_FILES_64  := arm64/libcam2utils.so
LOCAL_SRC_FILES_32	:= arm/libcam2utils.so
include $(BUILD_PREBUILT)

#ifeq ($(USE_MTK_CAMERA_WRAPPER),true)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    StreamImgBuf.cpp \
	Format.cpp \
	BaseImageBuffer.cpp \
	DefaultBufHandler.cpp \
    BaseImageBufferHeap.cpp \
    ImageBufferHeap.cpp \
    Misc.cpp

LOCAL_SRC_FILES += \
	mtk_ui.cpp
	
LOCAL_C_INCLUDES := \
	$(TOP)/frameworks/av/include \
	$(TOP)/system/media/camera/include \
	$(TOP)/frameworks/native/libs/nativebase/include \
	$(TOP)/frameworks/native/libs/nativewindow/include \
	$(TOP)/frameworks/native/libs/arect/include \

LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/inc \
	frameworks/native/include
	
LOCAL_REQUIRED_MODULES += libcam2utils

LOCAL_CPPFLAGS += -fexceptions

LOCAL_CFLAGS += "-fno-stack-protector"
LOCAL_LDLIBS := -lcutils -lcam2utils

LOCAL_STATIC_LIBRARIES := libcamera_client_mtk

LOCAL_SHARED_LIBRARIES := liblog libutils libcutils libdl \
	libui

LOCAL_MODULE := libcam_utils
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
#endif
