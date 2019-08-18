#include <stdlib.h>

#include <utils/Log.h>
#include <binder/IServiceManager.h>
#include <media/AudioSystem.h>
#include <media/IAudioFlinger.h>
#include <media/IAudioPolicyService.h>
#include <math.h>
#include <EGL/egl.h>

#include <system/audio.h>


/* fix for libgem used by mtkomxcodecs */

extern "C" EGLAPI const char* eglQueryStringImplementationANDROID(EGLDisplay dpy, EGLint name);

extern "C" {
EGLAPI const char* _Z35eglQueryStringImplementationANDROIDPvi(EGLDisplay dpy, EGLint name){
		return eglQueryStringImplementationANDROID(dpy,name);
}
}

extern "C" {
 void _ZN7android11IDumpTunnel11asInterfaceERKNS_2spINS_7IBinderEEE(){}
 //void _ZN7android22AudioMTKGainController17SetHeadPhoneLGainEi(uint32_t DegradedBGain) {}
 //void _ZN7android22AudioMTKGainController17SetHeadPhoneRGainEi(uint32_t DegradedBGain) {}
 //void _ZN7android22AudioMTKGainController14SetSpeakerGainEi(uint32_t DegradedBGain) {}
 //void _ZN7android22AudioMTKGainController12ApplyMicGainE13GAIN_MIC_MODE11GAIN_DEVICE12audio_mode_t(uint32_t MicType, int mode) {}



}
