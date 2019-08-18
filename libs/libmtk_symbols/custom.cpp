/* 
 * This File is used to setup camera Parameters
 * 
 * 
 * */


#define LOG_TAG "flash_custom.cpp"
#define MTK_LOG_ENABLE 1

#include "BuiltinTypes.h"

#include <cutils/log.h>

/* 0: disable dualflash */
int cust_isDualFlashSupport(int sensorDev)
{
    return 0;
}

/*
namespace IspTuning {
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
MUINT32
IspTuningCustom::
remap_ISO_value(MUINT32 const u4Iso) const
{
    MUINT32 remapIso = u4Iso;
    MUINT32 remapIsoFactor = 4;

    //add your remap ISO code here
	remapIso = remapIso * remapIsoFactor;
	
    ALOGD("[%s] ISO: in(%d), out(%d)", __FUNCTION__, u4Iso, remapIso);
    return remapIso;
}
} */

extern "C" {
/*	
uint _ZNK11NSIspTuning15IspTuningCustom15remap_ISO_valueEj(uint u4Iso)
{
	uint remapIso = u4Iso;
    uint remapIsoFactor = 4;

    //add your remap ISO code here
	remapIso = (remapIso * remapIsoFactor);
	
    ALOGD("[remap_ISO_value] ISO: in(%d), out(%d)",  u4Iso, remapIso);
    return remapIso;	
}
*/
void _ZNK7android16CameraParameters22getPreviewCallBackSizeEPiS1_(int* p1, int* p2){
			return;
}
/*
void android::CameraParameters::getPreviewCallBackSize(int* p1, int* p2){
return;
} */

}
/*
namespace TsfCore {
	
void Shading_TSF_int(void* p0, int p1, int p2, int* p3, int* p4, int* p5)
{
	return;
	}
void Shading_TSF_int(void* p6,void* p0, int p1, int p2, int* p3, int* p4, int* p5)
{
	return;
	}

void tsf_tbl_crcb_gain(int *p1){
	return;
	}

void tsf_tbl_crcb_gain(void* p0,int *p1){
	return;
	}
} */


/*
MBOOL
isEnableTSF(MINT32 i4SensorDev)
{
    return MTRUE;
    //return MFALSE;
}


const MINT32* getTSFAWBForceInput(void)
{
    // lv, cct, fluo, day fluo, rgain, bgain, ggain, rsvd
    static MINT32 rAWBInput[8] =
    {20, 2000, -110, -110, 512, 512, 512, 0};

    return rAWBInput;
}

MUINT32
getTSFD65Idx(void)
{
#define D65_IDX     (2)
    return D65_IDX;
}


#define TUNING_FOR_AIS  1

MINT32 isEnableSL2(MUINT32 u4SensorDev)
{
    if(TUNING_FOR_AIS) {
        return 1;        
    }
    return 0;
}

MINT32 isByp123ToNvram(void)
{
    return 1;
}

MINT32 isLscTransformFromCapture(MUINT32 u4SensorDev)
{
    return 0;
}
*/
