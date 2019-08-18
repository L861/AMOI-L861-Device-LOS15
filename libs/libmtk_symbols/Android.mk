

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	IGraphicBufferConsumer.cpp \
	BufferItemConsumer.cpp \
	Buffer.cpp \
	MediatekHacks.cpp \
	mtkcamhack.cpp \
    mtk_jpeg.cpp \
	mtk_audio.cpp \
	mtk_omx.cpp \
	icu55.c \
	crypto.c \
	ssl.c \
	atomic.c \
	mtk_ui.cpp \

#	IGraphicBufferConsumer.cpp \
#	BufferItemConsumer.cpp \
#    sensorlistener/ISensorServer.cpp \
#    sensorlistener/SensorManager.cpp \
#    sensorlistener/SensorEventQueue.cpp \
 




#LOCAL_SRC_FILES := \
#    sensorlistener/ISensorServer.cpp \
#    sensorlistener/SensorManager.cpp \
#    sensorlistener/SensorEventQueue.cpp \

#LOCAL_SHARED_LIBRARIES += libcam.utils.sensorlistener


# 	custom.cpp \
#    mtkcam/Property.cpp \
#    xlog.c

#	CameraParameters.cpp \
#    sensorlistener/ISensorServer.cpp \
#    sensorlistener/SensorManager.cpp \
	
#    IGraphicBufferConsumer.cpp \
#    BufferItemConsumer.cpp

#        Buffer.cpp \
#    sensorlistener/ISensorServer.cpp \
#    sensorlistener/SensorManager.cpp \


#LOCAL_C_INCLUDES += $(LOCAL_PATH)/params
#LOCAL_C_INCLUDES += $(LOCAL_PATH)/params/inc

#LOCAL_C_INCLUDES += frameworks/native/libs/nativebase/include
#LOCAL_C_INCLUDES += frameworks/av/include

    

# only for 32bit libraries
LOCAL_SRC_FILES_32 := mtk_string.cpp
#LOCAL_SRC_FILES_32 += mtk_wvm32.cpp
# only for 64bit libraries
LOCAL_SRC_FILES_64 := mtk_parcel.cpp
#LOCAL_SRC_FILES_64 += mtk_wvm64.cpp

LOCAL_LDLIBS := -lcutils 
#LOCAL_ALLOW_UNDEFINED_SYMBOLS := true
#LOCAL_WHOLE_STATIC_LIBRARIES += libtsfsw

LOCAL_SHARED_LIBRARIES := libaudioclient libcutils libbinder libutils liblog libgui libui libicuuc libicui18n libcrypto libstagefright_foundation libssl libnativeloader libEGL  libGLESv2 libsync libbase

#libsensor
#LOCAL_SHARED_LIBRARIES += libcam.utils.sensorlistener




ifeq ($(USE_MTK_CAMERA_WRAPPER), true)

# LOCAL_WHOLE_STATIC_LIBARIES += libcam_utils_static

#LOCAL_WHOLE_STATIC_LIBRARIES += \
#	libcam.halsensor.wrapper \
# libcam.halsensor.custom

#LOCAL_SHARED_LIBRARIES += \
#	libcam.halsensor \
#	libcameracustom

endif

#LOCAL_STATIC_LIBRARIES += libtsfsw



LOCAL_C_INCLUDES += frameworks/av/media/mtp/ system/core/include/ frameworks/rs/server/ frameworks/av/include/ hardware/libhardware/include/ frameworks/native/libs/sensor/include/ frameworks/native/include
LOCAL_MODULE := libmtk_symbols
LOCAL_MODULE_TAGS := optional

LOCAL_CLANG := true
LOCAL_CPPFLAGS := -std=c++1y
# LOCAL_SANITIZE := integer
LOCAL_CPPFLAGS += -Wno-exit-time-destructors
LOCAL_CPPFLAGS += -Wno-global-constructors
LOCAL_CPPFLAGS += -Wno-c++98-compat-pedantic
LOCAL_CPPFLAGS += -Wno-four-char-constants
LOCAL_CPPFLAGS += -Wno-padded
LOCAL_CPPFLAGS += -Wno-unused-parameter


USE_NEW_MTK_JPEG := false
ifeq ($(USE_NEW_MTK_JPEG), true)

LOCAL_CPPFLAGS += -DUSE_NEW_MTK_JPEG
LOCAL_CFLAGS += -DUSE_NEW_MTK_JPEG
LOCAL_SHARED_LIBRARIES += libm4u libJpgEncPipe
LOCAL_C_INCLUDES += $(DEVICE_PATH)/hal/m4u/$(MTK_PLATFORM)
LOCAL_C_INCLUDES += $(DEVICE_PATH)/hal/libJpgEncPipe/include
LOCAL_WHOLE_STATIC_LIBRARIES += libmtk_drvb_base

#LOCAL_LDLIBS += -lJpgEncPipe
endif



LOCAL_PROPRIETARY_MODULE = true
include $(BUILD_SHARED_LIBRARY)


# Sensorslistner_shim

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    sensorlistener/ISensorServer.cpp \
    sensorlistener/SensorManager.cpp \
    sensorlistener/SensorEventQueue.cpp 

LOCAL_PROPRIETARY_MODULE = true

LOCAL_C_INCLUDES := frameworks/av/media/mtp/ system/core/include/ system/core/base/include/ frameworks/rs/server/ frameworks/av/include/ hardware/libhardware/include/ frameworks/native/libs/sensor/include/ frameworks/native/include

LOCAL_LDLIBS := -lcutils

LOCAL_SHARED_LIBRARIES := libaudioclient libcutils libbinder libutils liblog libgui libui libicuuc libicui18n libcrypto libstagefright_foundation libssl libnativeloader libEGL  libGLESv2 libsync libbase libsensor

LOCAL_MODULE := libSensorslistener_shim


include $(BUILD_SHARED_LIBRARY)
