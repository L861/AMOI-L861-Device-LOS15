LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	Buffer.cpp \
	MediatekHacks.cpp \
	mtkcamhack.cpp \
    mtk_jpeg.cpp \
	mtk_audio.cpp \
	mtk_ui.cpp \
	mtk_omx.cpp \
	icu55.c \
	crypto.c \
	ssl.c \
	CameraParameters.cpp \
	BufferItemConsumer.cpp \
	IGraphicBufferConsumer.cpp 
	
#	atomic.c \
#    sensorlistener/ISensorServer.cpp \
#    sensorlistener/SensorManager.cpp \
	
#    IGraphicBufferConsumer.cpp \
#    BufferItemConsumer.cpp

#        Buffer.cpp \
#    sensorlistener/ISensorServer.cpp \
#    sensorlistener/SensorManager.cpp \
    

# only for 32bit libraries
LOCAL_SRC_FILES_32 := mtk_string.cpp
#LOCAL_SRC_FILES_32 += mtk_wvm32.cpp
# only for 64bit libraries
LOCAL_SRC_FILES_64 := mtk_parcel.cpp
#LOCAL_SRC_FILES_64 += mtk_wvm64.cpp

LOCAL_LDLIBS := -lcutils

LOCAL_SHARED_LIBRARIES := libaudioclient libcutils libbinder libutils liblog libgui libui libicuuc libicui18n libcrypto libstagefright_foundation libssl libnativeloader libEGL  libGLESv2 libsync libbase libsensor libcam.utils.sensorlistener
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
LOCAL_PROPRIETARY_MODULE = true
include $(BUILD_SHARED_LIBRARY)



