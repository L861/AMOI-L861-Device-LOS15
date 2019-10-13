LOCAL_PATH := $(call my-dir)

# iSu Support

include $(CLEAR_VARS)
LOCAL_MODULE            := init.superuser.isu.rc
LOCAL_MODULE_TAGS       := optional eng
LOCAL_MODULE_CLASS      := ETC
LOCAL_SRC_FILES         := init.superuser.isu.rc
LOCAL_MODULE_PATH       := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE            := isu.sh
LOCAL_MODULE_TAGS       := optional eng
LOCAL_MODULE_CLASS      := ETC
LOCAL_SRC_FILES         := isu.sh
LOCAL_MODULE_PATH       := $(TARGET_ROOT_OUT)/sbin
include $(BUILD_PREBUILT)
