LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	GraphicBufferExtra.cpp \
	GraphicBufferExtra_hal.cpp

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/../include

LOCAL_C_INCLUDES += \
	$(TOP)/system/core/libion/include \
    $(TOP)/$(DEVICE_PATH)/kernel-headers \
	$(TOP)/frameworks/native/libs/nativewindow/include \
	$(TOP)/frameworks/native/libs/nativebase/include \
	$(TOP)/frameworks/native/libs/arect/include \
#	$(TOP)/kernel/openstone/L861/drivers/staging/android/uapi

LOCAL_SHARED_LIBRARIES := \
	libhardware \
	libcutils \
	libutils

LOCAL_LDLIBS := -llog

LOCAL_EXPORT_C_INCLUDE_DIRS := \
	$(LOCAL_PATH)/include

LOCAL_MODULE := libgralloc_extra

include $(BUILD_SHARED_LIBRARY)
