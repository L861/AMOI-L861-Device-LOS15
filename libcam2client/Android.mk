# wrapper library for libcam.halsensor
#


LOCAL_PATH := $(call my-dir)


include $(CLEAR_VARS)
LOCAL_MULTILIB := both
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE            := libcam2client
LOCAL_MODULE_OWNER = mtk
LOCAL_MODULE_SUFFIX = .so
LOCAL_SRC_FILES_64  := arm64/libcam2client.so
LOCAL_SRC_FILES_32	:= arm/libcam2client.so
# The header files should be located in the following dir relative to jni/ dir
#LOCAL_EXPORT_C_INCLUDES := include/
include $(BUILD_PREBUILT)



#ifeq ($(USE_MTK_CAMERA_WRAPPER),true)
include $(CLEAR_VARS)


#LOCAL_CPP_EXTENSION := .cpp.c.cxx

LOCAL_SRC_FILES := \
    StreamImgBuf.cpp \


#LOCAL_SRC_FILES := $(LOCAL_PATH)/$(TARGET_ARCH)/libcam2client.so
    
#LOCAL_SRC_FILES_32 := \
#	$(LOCAL_PATH)/arm/libcam2client.so

#LOCAL_SRC_FILES_64 := \
#	$(LOCAL_PATH)/arm64/libcam2client.so
    

#LOCAL_SRC_FILES_32 := \
#	DisplayClient.BufOps.cpp \
#   DisplayClient.cpp \

LOCAL_C_INCLUDES := \
    $(TOP)/system/media/camera/include \
	$(TOP)/frameworks/native/libs/nativebase/include \
	$(LOCAL_PATH)/mtkcam

#LOCAL_WHOLE_STATIC_LIBRARIES += \
#	libcam_utils.common.imagebuffer \
#	libcam.client.displayclient

#LOCAL_STATIC_LIBRARIES += \
#	libcam_utils.common.imagebuffer \
#	libcam.client.displayclient

LOCAL_CFLAGS += "-fno-stack-protector"
LOCAL_LDLIBS := -lcutils -lcam2client

#LOCAL_STATIC_LIBRARIES := libcam2client

LOCAL_STATIC_LIBRARIES += \
	libcam_utils.common.imagebuffer \
	libcam.client.displayclient

LOCAL_SHARED_LIBRARIES := liblog libutils libcutils libdl \
			  libcam_utils libcam2client
#libcam2client


LOCAL_MODULE := libcam.client
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
#endif
