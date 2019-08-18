#include <string>
#include <cutils/native_handle.h>
#include <ui/GraphicBuffer.h>


#include <linux/compiler.h>
#include <linux/types.h>

#include <hardware/camera.h>

#ifdef USE_NEW_MTK_JPEG
#include <enc/jpeg_hal.h>
#endif
// #include <gui/BufferItemConsumer.h>


extern "C" void _ZN7android13GraphicBufferC1EjjijjjP13native_handleb(
        const native_handle_t* handle,
        android::GraphicBuffer::HandleWrapMethod method,
        uint32_t width,
        uint32_t height,
        int format,
        uint32_t layerCount,
        uint64_t usage,
        uint32_t stride);

extern "C" void _ZN7android13GraphicBufferC1EjjijjP13native_handleb(
        uint32_t inWidth,
        uint32_t inHeight,
        int inFormat,
        uint32_t inUsage,
        uint32_t inStride,
        native_handle_t* inHandle,
        bool keepOwnership)
{
    android::GraphicBuffer::HandleWrapMethod inMethod =
        (keepOwnership ? android::GraphicBuffer::TAKE_HANDLE : android::GraphicBuffer::WRAP_HANDLE);
    _ZN7android13GraphicBufferC1EjjijjjP13native_handleb(inHandle, inMethod, inWidth, inHeight,
        inFormat, static_cast<uint32_t>(1), static_cast<uint64_t>(inUsage), inStride);
}

/* bool setEncSize(JUINT32 width, JUINT32 height, EncFormat encformat) ; */
/* new bool setEncSize(JUINT32 width, JUINT32 height, EncFormat encformat, bool isSrcBufNeedFlush = true) ; */


// /* JpgEncHal::setEncSize(unsigned int, unsigned int, JpgEncHal::EncFormat) */


#ifdef USE_NEW_MTK_JPEG

extern "C" bool _ZN9JpgEncHal10setEncSizeEjjNS_9EncFormatEb(JUINT32 width,JUINT32 height, JpgEncHal::EncFormat encformat,bool isSrcBufNeedFlush = true);

extern "C" bool _ZN9JpgEncHal10setEncSizeEjjNS_9EncFormatE(JUINT32 width,JUINT32 height, JpgEncHal::EncFormat encformat){
	return _ZN9JpgEncHal10setEncSizeEjjNS_9EncFormatEb(width, height, encformat, true);
	//return JpgEncHal::setEncSize(width, height, encformat, true);
}

#endif
/*
void dummy1(){};

extern "C" void _ZN7TsfCore15Shading_TSF_intEPviiPiS1_S1_ (void* p1, int p2, int p3, int* p4, int* p5, int* p6){
   	dummy1();
}

_ZN6AppTsf7TsfMainEv

extern "C" bool  _Z11isEnableTSFi(int param1){
	return false;
}

*/
