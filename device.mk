# Dalvik heap configurations
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-3072-dalvik-heap.mk)

# Call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-3072-hwui-memory.mk)

# Vendor
$(call inherit-product, vendor/openstone/L861/L861-vendor-blobs.mk)

# Telecom
PRODUCT_PACKAGES += Telecom

# Folder path
DEVICE_PATH := device/openstone/L861

-include $(DEVICE_PATH)/hidl.mk

# Overlay Folder
DEVICE_PACKAGE_OVERLAYS += \
         $(DEVICE_PATH)/overlay \
         $(DEVICE_PATH)/overlay-lineage

# Screen density
PRODUCT_AAPT_CONFIG := normal xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Recovery allowed devices
TARGET_OTA_ASSERT_DEVICE := L861


#hw composer
PRODUCT_PACKAGES += hwcomposer.mt6795


# Super User ROOT
PRODUCT_PACKAGES += su

PRODUCT_PROPERTY_OVERRIDES += persist.sys.root_access=3


# FMRadio
PRODUCT_PACKAGES += \
	libmtkplayer \
	FMRadio \
    libfmcust \
    libfmmt6630


PRODUCT_PROPERTY_OVERRIDES += \
    ro.mtk_fm_recording_support=1 \
	persist.mtk.wcn.combo.chipid=-1 \
	persist.mtk.combo.coredump=no \
	service.wcn.driver.ready=no \
	service.wcn.coredump.mode=2

PRODUCT_PROPERTY_OVERRIDES += \
	fmradio.driver.enable=1 \
	ro.mtk_bt_fm_over_bt=1	

# Power
PRODUCT_PACKAGES += \
	power.default \
	power.mt6795

# Modem controller
PRODUCT_PACKAGES += \
        md_ctrl

# Weather
PRODUCT_PACKAGES += \
   WeatherProvider \
   WeatherManagerService

# Camera
#	Snap \
#	libcam.halsensor \
#	libcam2halsensor \
#	libcam.halsensor \

# Sensors
#PRODUCT_PACKAGES += \
#	multihal \
#	sensors.default

#	libcam2halsensor \
#	libcam.halsensor \
#	libcam2client \
#	libcam.client \
#	libcam.camnode \
#	libcam1_utils \	

PRODUCT_PACKAGES += \
	libcameracustom \
	libstdc++ \
	libmtkcamera_client \
	Camera2 \
	CameraNext \
	libcam.camadapter \
	libcam.client \
	libcam_utils

#	libcam.paramsmgr \
#	libcam.camadapter \
#	libcam.iopipe
	
# 	libmtkcamera_client \
#	libcam.client \
# 	libcamera_parameters_ext \	
# 	libcamera_parameters_mtk \
#	libcam.halsensor \
#	libtsfsw_shim
	
# Charger
#	libfgauge \
#    lineage_charger_res_images \
#    font_log.png \
#    libhealthd.lineage
PRODUCT_PACKAGES += \
	charger \
	charger_res_images \


# Custom charger images
# PRODUCT_COPY_FILES += \
#$(LOCAL_PATH)/charger/res/images/lineage_battery_scale.png:root/res/images/charger/lineage_battery_scale.png \
#$(LOCAL_PATH)/charger/res/images/font_log.png:root/res/images/font_log.png
#$(LOCAL_PATH)/charger/res/values/charger/animation.txt:root/res/values/charger/animation.txt \

    
# Timezone
#PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
#     persist.sys.timezone=Europe/Rome

# Torch
PRODUCT_PACKAGES += \
	Torch


# Prebuilt Apps
# PRODUCT_PACKAGES += \
#        GFManager \
#        LetvRemoteControl_preinstall \
#        UEIQuicksetSDKLeTV

# Other
PRODUCT_PACKAGES += \
	librs_jni \
	libnl_2 \
	com.android.future.usb.accessory

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.allow.mock.location=0 \
	ro.secure=0 \
	ro.adb.secure=0 \
	ro.debuggable=1 \
	ro.zygote=zygote64_32 \
	ro.dalvik.vm.native.bridge=0 \
	persist.debug.xlog.enable=0 \
	camera.disable_zsl_mode=1
#persist.sys.usb.config=mtp,adb \

ifeq (lineage_L861,$(TARGET_PRODUCT))	#this is included only in lineage atm as some other roms have issue with this
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	dalvik.vm.dex2oat-Xms=64m \
	dalvik.vm.dex2oat-Xmx=64m \
	dalvik.vm.image-dex2oat-Xms=64m \
	dalvik.vm.image-dex2oat-Xmx=512m
endif



# Audio
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \
	audio_policy.default \
	libaudio-resampler \
	libaudiopolicymanagerdefault \
	libtinyalsa \
	libtinycompress \
	libtinyxml \
	audio_policy.stub \
	libtinymix \
	libfs_mgr \
	tinymix \
	tinyhostless \
	tinypcminfo \
	tinycap \
	tinyplay \
	
# Vipersound
# USE_VIPER_PROFILES := true
PRODUCT_PACKAGES += \
	ViperSound


# MTK Vendor
#PRODUCT_PACKAGES += \
#	libperfservicenative

# Wifi
PRODUCT_PACKAGES += \
	lib_driver_cmd_mt66xx \
	libwpa_client \
	hostapd \
	wpa_supplicant \
        wificond \
        wifilogd

# Media
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/camera/camerasize.xml:system/etc/camerasize.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/vendor/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/vendor/etc/media_codecs_google_telephony.xml \
	$(DEVICE_PATH)/configs/media/media_codecs_google_video_le.xml:system/vendor/etc/media_codecs_google_video_le.xml \
	$(DEVICE_PATH)/configs/media/media_codecs_google_video.xml:system/vendor/etc/media_codecs_google_video.xml \
	$(DEVICE_PATH)/configs/media/media_codecs_ffmpeg.xml:system/vendor/etc/media_codecs_ffmpeg.xml

# Filesystem management tools
PRODUCT_PACKAGES += \
	e2fsck \
	fibmap.f2fs \
	fsck.f2fs \
	mkfs.f2fs \
	make_ext4fs \
	resize2fs \
	setup_fs \
	ext4_resize \
	libext2_blkid \
	libext2_uuid_static \
	superumount

# exFAT
PRODUCT_PACKAGES += \
	mount.exfat \
	fsck.exfat \
	mkfs.exfat

# NTFS
PRODUCT_PACKAGES += \
	fsck.ntfs \
	mkfs.ntfs \
	mount.ntfs

PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/ramdisk/enableswap.sh:root/enableswap.sh \
	$(DEVICE_PATH)/ramdisk/factory_init.project.rc:root/factory_init.project.rc \
	$(DEVICE_PATH)/ramdisk/factory_init.rc:root/factory_init.rc \
	$(DEVICE_PATH)/ramdisk/fstab.mt6795:root/fstab.mt6795 \
	$(DEVICE_PATH)/ramdisk/init.modem.rc:root/init.modem.rc \
	$(DEVICE_PATH)/ramdisk/init.mt6795.rc:root/init.mt6795.rc \
	$(DEVICE_PATH)/ramdisk/init.mt6795.usb.rc:root/init.mt6795.usb.rc \
	$(DEVICE_PATH)/ramdisk/init.project.rc:root/init.project.rc \
	$(DEVICE_PATH)/ramdisk/ueventd.mt6795.rc:root/ueventd.mt6795.rc \
	$(DEVICE_PATH)/ramdisk/init.volte.rc:root/init.volte.rc \
	$(DEVICE_PATH)/ramdisk/init.mal.rc:root/init.mal.rc \
	$(DEVICE_PATH)/ramdisk/init.trustonic.rc:root/init.trustonic.rc \
	$(DEVICE_PATH)/ramdisk/meta_init.modem.rc:root/meta_init.modem.rc \
	$(DEVICE_PATH)/ramdisk/meta_init.project.rc:root/meta_init.project.rc \
	$(DEVICE_PATH)/ramdisk/meta_init.rc:root/meta_init.rc \
	$(DEVICE_PATH)/ramdisk/fstab.charger:root/fstab.charger \

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
	frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.camera.manual_sensor.xml:system/etc/permissions/android.hardware.camera.manual_sensor.xml


# 	$(DEVICE_PATH)/configs/media/media_codecs_ffmpeg.xml:system/vendor/etc/media_codecs_ffmpeg.xml \

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/media/media_codecs.xml:system/vendor/etc/media_codecs.xml \
	$(DEVICE_PATH)/configs/media/media_codecs_mediatek_audio.xml:system/vendor/etc/media_codecs_mediatek_audio.xml\
	$(DEVICE_PATH)/configs/media/media_codecs_mediatek_video.xml:system/vendor/etc/media_codecs_mediatek_video.xml \
	$(DEVICE_PATH)/configs/media/media_codecs_performance.xml:system/vendor/etc/media_codecs_performance.xml \
	$(DEVICE_PATH)/configs/media/media_profiles.xml:system/vendor/etc/media_profiles.xml \
	$(DEVICE_PATH)/configs/mtk_clear_motion.cfg:system/etc/mtk_clear_motion.cfg

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/audio/audio_device.xml:system/vendor/etc/audio_device.xml \
	$(DEVICE_PATH)/configs/audio/audio_effects.xml:system/vendor/etc/audio_effects.xml \
	$(DEVICE_PATH)/configs/audio/audio_em.xml:system/vendor/etc/audio_em.xml \
	$(DEVICE_PATH)/configs/audio/audio_policy.conf:system/vendor/etc/audio_policy.conf \
	$(DEVICE_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
	$(DEVICE_PATH)/configs/audio/audio_device.xml:system/etc/audio_device.xml \
	$(DEVICE_PATH)/configs/audio/audio_effects.xml:system/etc/audio_effects.xml \
	$(DEVICE_PATH)/configs/audio/audio_em.xml:system/etc/audio_em.xml

# Audio Policy Configurations
PRODUCT_COPY_FILES += \
	frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:system/vendor/etc/audio/a2dp_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:system/vendor/etc/audio/r_submix_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/vendor/etc/audio/usb_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/default_volume_tables.xml:system/vendor/etc/audio/default_volume_tables.xml \
	frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:system/vendor/etc/audio/audio_policy_volumes.xml

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/permissions/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	$(DEVICE_PATH)/configs/permissions/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml \
	$(DEVICE_PATH)/configs/permissions/com.android.location.provider.xml:system/etc/permissions/com.android.location.provider.xml \
	$(DEVICE_PATH)/configs/permissions/com.android.media.remotedisplay.xml:system/etc/permissions/com.android.media.remotedisplay.xml \
	$(DEVICE_PATH)/configs/permissions/com.android.mediadrm.signer.xml:system/etc/permissions/com.android.mediadrm.signer.xml \
	$(DEVICE_PATH)/configs/permissions/android.hardware.camera.manual_postprocessing.xml:system/etc/permissions/android.hardware.camera.manual_postprocessing.xml \
	$(DEVICE_PATH)/configs/permissions/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/vendor/etc/wifi/p2p_supplicant_overlay.conf \
	$(DEVICE_PATH)/configs/wifi/wpa_supplicant.conf:system/vendor/etc/wifi/wpa_supplicant.conf \
	$(DEVICE_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/vendor/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/bluetooth/auto_pair_blacklist.conf:system/vendor/etc/bluetooth/auto_pair_blacklist.conf \
	$(DEVICE_PATH)/configs/bluetooth/auto_pair_devlist.conf:system/vendor/etc/bluetooth/auto_pair_devlist.conf \
	$(DEVICE_PATH)/configs/bluetooth/btconfig.xml:system/vendor/etc/bluetooth/btconfig.xml \
	$(DEVICE_PATH)/configs/bluetooth/bt_did.conf:system/vendor/etc/bluetooth/bt_did.conf \
	$(DEVICE_PATH)/configs/bluetooth/bt_stack.conf:system/vendor/etc/bluetooth/bt_stack.conf \
	$(DEVICE_PATH)/configs/bluetooth/bt_stack.conf.debug:system/vendor/etc/bluetooth/bt_stack.conf.debug \
	$(DEVICE_PATH)/configs/bluetooth/bt_stack.conf.sqc:system/vendor/etc/bluetooth/bt_stack.conf.sqc

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/keylayout/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl \
	$(DEVICE_PATH)/configs/keylayout/ACCDET.kl:system/usr/keylayout/ACCDET.kl\
	$(DEVICE_PATH)/configs/keylayout/mtk-tpd.kl:system/usr/keylayout/mtk-tpd.kl\
	$(DEVICE_PATH)/configs/keylayout/synaptics_dsx_i2c.kl:system/usr/keylayout/synaptics_dsx_i2c.kl

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/ril_conf/ecc_list.xml:system/etc/ecc_list.xml \
	$(DEVICE_PATH)/configs/ril_conf/spn-conf.xml:system/etc/spn-conf.xml

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/dhcpcd/dhcpcd-run-hooks:system/etc/dhcpcd/dhcpcd-run-hooks \
	$(DEVICE_PATH)/configs/dhcpcd/dhcpcd-hooks/20-dns.conf:system/etc/dhcpcd/dhcpcd-hooks/20-dns.conf \
	$(DEVICE_PATH)/configs/dhcpcd/dhcpcd-hooks/95-configured:system/etc/dhcpcd/dhcpcd-hooks/95-configured \
	$(DEVICE_PATH)/configs/wide-dhcpv6/dhcp6c.conf:system/etc/wide-dhcpv6/dhcp6c.conf \
	$(DEVICE_PATH)/configs/wide-dhcpv6/dhcp6c.script:system/etc/wide-dhcpv6/dhcp6c.script \
	$(DEVICE_PATH)/configs/wide-dhcpv6/dhcp6cctlkey:system/etc/wide-dhcpv6/dhcp6cctlkey \
	$(DEVICE_PATH)/configs/wide-dhcpv6/dhcp6cDNS.conf:system/etc/wide-dhcpv6/dhcp6cDNS.conf \
	$(DEVICE_PATH)/configs/wide-dhcpv6/dhcp6s.conf:system/etc/wide-dhcpv6/dhcp6s.conf

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/radvd/radvd.conf:system/vendor/etc/radvd/radvd.conf

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/slp_conf:system/etc/slp_conf \
	$(DEVICE_PATH)/configs/gps/gps.conf:system/etc/gps.conf \
	$(DEVICE_PATH)/configs/clatd.conf:system/etc/clatd.conf \
	$(DEVICE_PATH)/configs/custom.conf:system/etc/custom.conf \
	$(DEVICE_PATH)/configs/mtklog-config.prop:system/etc/mtklog-config.prop \
	$(DEVICE_PATH)/configs/mtk_omx_core.cfg:system/etc/mtk_omx_core.cfg \
	$(DEVICE_PATH)/configs/mtk_omx_core.cfg:system/vendor/etc/mtk_omx_core.cfg \
	$(DEVICE_PATH)/configs/perfservboosttbl.txt:system/etc/perfservboosttbl.txt \
	$(DEVICE_PATH)/configs/perfservscntbl.txt:system/etc/perfservscntbl.txt

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml

#PRODUCT_COPY_FILES += \
#	frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml

# Mediaserver with system group
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/init/mediaserver.rc:system/etc/init/mediaserver.rc

ifneq ($(TARGET_HAS_LEGACY_CAMERA_HAL1), true)

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/init/cameraserver.rc:system/etc/init/cameraserver.rc
	
endif

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/hostapd/hostapd_default.conf:system/vendor/etc/hostapd/hostapd_default.conf \
	$(DEVICE_PATH)/configs/hostapd/hostapd.accept:system/vendor/etc/hostapd/hostapd.accept \
	$(DEVICE_PATH)/configs/hostapd/hostapd.deny:system/vendor/etc/hostapd/hostapd.deny


# NFC
PRODUCT_PACKAGES += \
	com.android.nfc_extras \
	nfc_nci.mt6605.default \
	libmtknfc \
	Nfc \
	Tag

PRODUCT_COPY_FILES += $(DEVICE_PATH)/configs/nfc/nfcstackp:system/bin/nfcstackp

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/nfc/MTKNfclicense.lic:system/etc/MTKNfclicense.lic \
	frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
	frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
	$(DEVICE_PATH)/configs/permissions/com.gsma.services.nfc.xml:system/etc/permissions/com.gsma.services.nfc.xml \
	$(DEVICE_PATH)/configs/permissions/privapp-permissions-mediatek.xml:system/etc/permissions/privapp-permissions-mediatek.xml

PRODUCT_COPY_FILES += $(DEVICE_PATH)/configs/nfc/nfc.cfg:system/vendor/etc/nfc.cfg
PRODUCT_COPY_FILES += $(DEVICE_PATH)/configs/nfc/nfcse.cfg:system/vendor/etc/nfcse.cfg
PRODUCT_COPY_FILES += $(DEVICE_PATH)/configs/nfc/nfcee_access.xml:system/vendor/etc/nfcee_access.xml

PRODUCT_COPY_FILES += $(DEVICE_PATH)/configs/nfc/nfc.cfg:system/etc/nfc.cfg
PRODUCT_COPY_FILES += $(DEVICE_PATH)/configs/nfc/nfcse.cfg:system/etc/nfcse.cfg
PRODUCT_COPY_FILES += $(DEVICE_PATH)/configs/nfc/nfcee_access.xml:system/etc/nfcee_access.xml


# MTK Helpers
PRODUCT_PACKAGES += \
	libccci_util \
	libmtk_symbols \
	asec_helper \

# libxlog (inc. in libmtk_symbols)

# Sensor Calibration
PRODUCT_PACKAGES += libem_sensor_jni

# Configure jemalloc for low memory
MALLOC_SVELTE := true

# Radio dependencies
PRODUCT_PACKAGES += \
	muxreport \
	terservice

# Display
PRODUCT_PACKAGES += \
	libion

# Lights
PRODUCT_PACKAGES += \
        lights.default

# GPS
PRODUCT_PACKAGES += \
	gps.mt6795 \
	libcurl

#camera
PRODUCT_PACKAGES += \
    libcamera_parameters_mtk \
    libcamera_client_mtk \
	libm4u \
	libSensorslistener_shim \
# 	libbwc \

#Camera Legacy
PRODUCT_PROPERTY_OVERRIDES += \
     media.stagefright.less-secure=true

ifeq ($(TARGET_HAS_LEGACY_CAMERA_HAL1), true)
	PRODUCT_PROPERTY_OVERRIDES += \
		 media.stagefright.legacyencoder=true
	
#	PRODUCT_PACKAGES += \
#		android.hardware.camera.common@1.0
endif


# Vulkan
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:system/etc/permissions/android.hardware.vulkan.level.xml \
	frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version.xml

# Seccomp policy
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/seccomp/mediacodec.policy:system/vendor/etc/seccomp_policy/mediacodec.policy \
	$(DEVICE_PATH)/seccomp/mediaextractor.policy:system/vendor/etc/seccomp_policy/mediaextractor.policy

# HIDL Manifest
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/manifest.xml:system/vendor/manifest.xml

# Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor \
    libbluetooth_mtk

# Graphics
PRODUCT_PACKAGES += \
    libgralloc_extra \
    libui_ext \
    libgui_ext

# XML Parser
PRODUCT_PACKAGES += libxml2
