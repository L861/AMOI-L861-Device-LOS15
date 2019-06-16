#include <string>
#include <cutils/native_handle.h>
#include <ui/GraphicBuffer.h>


#include <linux/compiler.h>
#include <linux/types.h>

#include <hardware/camera.h>
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




/* start additional */


/*

void _ZN7android22IGraphicBufferConsumer10BufferItemC1Ek(){};

	 
extern "C"  void _ZN7android22IGraphicBufferConsumer10BufferItemC1Ev(){
	_ZN7android22IGraphicBufferConsumer10BufferItemC1Ek();
	}	 

void _ZN7android18BufferItemConsumer20setDefaultBufferSizeEjk(){};

extern "C" void _ZN7android18BufferItemConsumer20setDefaultBufferSizeEjj(){
	_ZN7android18BufferItemConsumer20setDefaultBufferSizeEjk();
	};
	


void _ZN7android18BufferItemConsumer22setDefaultBufferFormatEk(){};
extern "C" void _ZN7android18BufferItemConsumer22setDefaultBufferFormatEj(){
	_ZN7android18BufferItemConsumer22setDefaultBufferFormatEk();
	}

void _ZN7android18BufferItemConsumer13acquireBufferEPNS_22IGraphicBufferConsumer10BufferItemExh(){};

extern "C" void _ZN7android18BufferItemConsumer13acquireBufferEPNS_22IGraphicBufferConsumer10BufferItemExb(){
	_ZN7android18BufferItemConsumer13acquireBufferEPNS_22IGraphicBufferConsumer10BufferItemExh();
	}	

*/
