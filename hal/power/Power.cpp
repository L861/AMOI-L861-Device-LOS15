/*
 * Copyright (C) 2016 The Android Open Source Project
 * Copyright (C) 2018 The LineageOS Project
 * Copyright (C) 2018 TeamNexus
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *	  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "zero-power"
// #define LOG_NDEBUG 0

#include <log/log.h>

#include <hardware/hardware.h>
#include <hardware/power.h>

#include "Power.h"
#include "Profiles.h"
#include <Zero_Utils.h>

namespace android {
namespace hardware {
namespace power {
namespace V1_0 {
namespace implementation {

using ::vendor::nexus::zero::Utils;

Power::Power()
{
	ALOGV("%s: enter;", __func__);
	power_lock();

	//
	// defaults
	//
	mIsInteractive = false;
	mRequestedProfile = SecPowerProfiles::INVALID;
	mCurrentProfile = SecPowerProfiles::INVALID;
	mLatestProfile = SecPowerProfiles::INVALID;
	mVariant = SecDeviceVariant::UNKNOWN;
	mIsDT2WEnabled = false;



	//
	// profiles
	//
	DEBUG_TIMING(profiles, Profiles::loadProfiles());

	//
	// initial device-setup
	//

	// set default power-profile
	mRequestedProfile = SecPowerProfiles::BALANCED;
	setProfile(mRequestedProfile);

	// enable all input-devices
	// setInputState(true);

	ALOGV("%s: exit;", __func__);
}

status_t Power::registerAsSystemService() {
	status_t ret = 0;

	ret = IPower::registerAsService();
	LOG_ALWAYS_FATAL_IF(ret != 0, "%s: failed to register IPower HAL Interface as service (%d), aborting...", __func__, ret);
	ALOGI("%s: registered IPower HAL Interface!", __func__);

	ret = ILineagePower::registerAsService();
	LOG_ALWAYS_FATAL_IF(ret != 0, "%s: failed to register ILineagePower HAL Interface as service (%d), aborting...", __func__, ret);
	ALOGI("%s: registered ILineagePower HAL Interface!", __func__);


	return 0;
}

Power::~Power() { }

// Methods from ::android::hardware::power::V1_0::IPower follow.
Return<void> Power::setInteractive(bool interactive) {
	auto begin = Utils::getTime();

	ALOGV("%s: enter; interactive=%d", __func__, interactive ? 1 : 0);
	power_lock();

	this->mIsInteractive = interactive;

	if (!interactive && Utils::screenIsOn()) {
		ALOGW("%s: not disabling interactive state when screen is still on", __func__);
		goto exit;
	}

	if (!interactive) {
		setProfile(SecPowerProfiles::SCREEN_OFF);
	} else {
		// reset to requested- or fallback-profile
		resetProfile(500);
	}

	setInputState(interactive);

exit:
	auto end = Utils::getTime();
	auto diff = end - begin;

	ALOGV("%s: exit; took %lldms", __func__, diff.count());
	return Void();
}

Return<void> Power::powerHint(PowerHint hint, int32_t data)  {
	// ALOGV("%s: enter; hint=%d, data=%d", __func__, hint, data);
	power_lock();

	switch_uint32_t (hint)
	{
		/*
		 * Profiles
		 */

		case_uint32_t (LineagePowerHint::SET_PROFILE):
		{
			ALOGV("%s: LineagePowerHint::SET_PROFILE(%d)", __func__, data);
			mRequestedProfile = static_cast<SecPowerProfiles>(data);
			setProfile(mRequestedProfile);
			break;
		}
		case_uint32_t (PowerHint::LOW_POWER):
		{
			ALOGV("%s: PowerHint::LOW_POWER(%d)", __func__, data);
			if (data) {
				setProfile(SecPowerProfiles::POWER_SAVE);
			} else {
				resetProfile();
			}
			break;
		}
		case_uint32_t (PowerHint::SUSTAINED_PERFORMANCE):
		{
			ALOGV("%s: PowerHint::SUSTAINED_PERFORMANCE(%d)", __func__, data);
			if (data) {
				setProfile(SecPowerProfiles::HIGH_PERFORMANCE);
			} else {
				resetProfile();
			}
			break;
		}
		case_uint32_t (PowerHint::VR_MODE):
		{
			ALOGV("%s: PowerHint::VR_MODE(%d)", __func__, data);
			if (data) {
				setProfile(SecPowerProfiles::HIGH_PERFORMANCE);
			} else {
				resetProfile();
			}
			break;
		}
		
		/*
		 * Interaction/Boosting
		 */
		case_uint32_t (PowerHint::INTERACTION):
		{
			// ALOGV("%s: PowerHint::INTERACTION(%d)", __func__, data);
			boostpulse(data);
			break;
		}
		case_uint32_t (PowerHint::LAUNCH):
		{
			// ALOGV("%s: PowerHint::LAUNCH(%d)", __func__, data);
			break;
		}
		case_uint32_t (PowerHint::VSYNC):
		{
			// ALOGV("%s: PowerHint::VSYNC(%d)", __func__, data);
			break;
		}
	}

	// ALOGV("%s: exit;", __func__);
	return Void();
}

Return<void> Power::setFeature(Feature feature, bool activate)  {
	ALOGV("%s: enter; feature=%d, activate=%d", __func__, feature, activate ? 1 : 0);
	power_lock();

	switch_uint32_t (feature)
	{
		case_uint32_t (Feature::POWER_FEATURE_DOUBLE_TAP_TO_WAKE):
		{
			mIsDT2WEnabled = activate;
			setDT2WState();
			break;
		}
	}

	ALOGV("%s: exit;", __func__);
	return Void();
}

Return<void> Power::getPlatformLowPowerStats(getPlatformLowPowerStats_cb _hidl_cb)  {
	ALOGV("%s: enter;", __func__);
	power_lock();

	hidl_vec<PowerStatePlatformSleepState> states;
	_hidl_cb(states, Status::SUCCESS);

	ALOGV("%s: exit;", __func__);
	return Void();
}

// Methods from ::vendor::lineage::power::V1_0::ILineagePower follow.
Return<int32_t> Power::getFeature(LineageFeature feature)  {	
	ALOGV("%s: enter; feature=%d", __func__, feature);
	power_lock();

	switch_uint32_t (feature)
	{
		case_uint32_t (LineageFeature::SUPPORTED_PROFILES):
		{
			return static_cast<int>(SecPowerProfiles::MAX_PROFILES);
		}

		case_uint32_t (Feature::POWER_FEATURE_DOUBLE_TAP_TO_WAKE):
		{
			return (Utils::isFile(POWER_DT2W_ENABLED) && 
			    Utils::canWrite(POWER_DT2W_ENABLED)) ? 1 : 0;
		}
	}

	ALOGV("%s: exit;", __func__);
	return -1;
}


// Private Methods
void Power::boostpulse(int duration) {
	std::lock_guard<std::mutex> autolock(mBoostpulseLock);

	if (duration <= 0) {
		duration = (1000 / 60) * 10;
	}

	// get current profile data
	const SecPowerProfile* data = Profiles::getProfileData(mCurrentProfile);

	if (data->cpu.freq_boost) {
		if (!Utils::updateCpuGov(0)) {
			ALOGW("Failed to load current cpugov-configuration for MTK");
#ifdef STRICT_BEHAVIOUR
			return;
#endif
		}

		Utils::writeCpuGov(0, "boost_freq", data->cpu.freq_boost);
		Utils::writeCpuGov(0, "boostpulse_duration", duration * 1000);
		Utils::writeCpuGov(0, "boostpulse", true);
	}
}

void Power::setProfile(SecPowerProfiles profile) {
	auto begin = Utils::getTime();
 	ALOGI("%s: applying profile %d", __func__, profile);

	// store it
	mCurrentProfile = profile;

	// check if user disabled power-profiles
	if (!isModuleEnabled("profiles")) {
		ALOGI("power profiles disabled by user!");
		return;
	}

	// apply settings
	const SecPowerProfile* data = Profiles::getProfileData(mCurrentProfile);

	if (!data->enabled) {
		return;
	}

	// online policy-cores before querying cpufreq-data
	CPU_ONLINE(0);


	if (data->cpu.enabled)
	{
		/*********************
		 * CPU Cluster0
		 */
		

		 
		
			PROFILE_WRITE("/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor", cpu, governor);

			if (!Utils::updateCpuGov(0)) {
				ALOGW("Failed to load current cpugov-configuration for MTK");
#ifdef STRICT_BEHAVIOUR
				return;
#endif
			}

			// to keep frequencies in range while screen-on we use the cpugovs, but
			// while screen-off it can happen that frequencies get increased too much
			// make sure our limits are being applied to the then-limiting,
			// not very reliable, files too
			
			// HPS
		    PROFILE_WRITE("/proc/hps/num_limit_power_serv",cpu,num_limit_power_serv);
			// cpufreq
			PROFILE_WRITE("/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq", cpu, freq_min);
			PROFILE_WRITE("/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq", cpu, freq_max);
			PROFILE_WRITE("/proc/cpufreq/cpufreq_limited_max_freq_by_user", cpu, freq_max);
		
		if (data->cpu.cores.enabled) {
			ALOGD("Set CPU and Governor Data");
			Utils::write("/proc/hps/enabled", 0); // disable HPS
			PROFILE_WRITE("/sys/devices/system/cpu/cpu0/online", cpu.cores, core1);
			PROFILE_WRITE("/sys/devices/system/cpu/cpu1/online", cpu.cores, core2);
			PROFILE_WRITE("/sys/devices/system/cpu/cpu2/online", cpu.cores, core3);
			PROFILE_WRITE("/sys/devices/system/cpu/cpu3/online", cpu.cores, core4);
			PROFILE_WRITE("/sys/devices/system/cpu/cpu4/online", cpu.cores, core5);
			PROFILE_WRITE("/sys/devices/system/cpu/cpu5/online", cpu.cores, core6);
			PROFILE_WRITE("/sys/devices/system/cpu/cpu6/online", cpu.cores, core7);
			PROFILE_WRITE("/sys/devices/system/cpu/cpu7/online", cpu.cores, core8);

			cpu_write(freq_min);
			cpu_write(freq_max);
			cpu_write2(freq_hispeed, "hispeed_freq");
		}
		
		for (int i = 0; data->cpu.governor_data[i].name[0]; i++) {
				Utils::writeCpuGov(0, data->cpu.governor_data[i].name,
					std::string(data->cpu.governor_data[i].data));
		}
		
	}

	/*********************
	 * cpusets
	 */
	if (data->cpusets.enabled) {
		PROFILE_WRITE("/dev/cpuset/cpus",                   cpusets, defaults);
		PROFILE_WRITE("/dev/cpuset/foreground/cpus",        cpusets, foreground);
		PROFILE_WRITE("/dev/cpuset/background/cpus",        cpusets, background);
		PROFILE_WRITE("/dev/cpuset/system-background/cpus", cpusets, system_background);
		PROFILE_WRITE("/dev/cpuset/top-app/cpus",           cpusets, top_app);
	}

	/*********************
	 * thermal_profile
	 */
	
	if (data->thermal_profile.enabled) {
		if (mLatestProfile != mCurrentProfile){
		Utils::exec_tp(data->thermal_profile.profilename);
		mLatestProfile = mCurrentProfile;
	  }
	} 

	/*********************
	 * GPU Defaults
	 */
	if (data->gpu.enabled) {
		PROFILE_WRITE("/d/ged/hal/fps_upper_bound",gpu,fps);
		if (data->gpu.dvfs.enabled) {
			PROFILE_WRITE("/proc/gpufreq/gpufreq_opp_max_freq",gpu.dvfs,freq_max);
		}
	}


	// Keep dynamic hotplugging disabled to 1.) ensure availability of all
	// clusters when power-HAL gets a setInteractive()-event and 2.)
	// to drastically lower the the screen-on-delay
	// Utils::write("/sys/power/enable_dm_hotplug", false);

	if (data->kernel.enabled) {
		// The power-efficient workqueue is useful for lower-power-situations, but
		// contraproductive in high-performance situations. This should reflect in
		// the static power-profiles
		PROFILE_WRITE("/sys/module/workqueue/parameters/power_efficient", kernel, pewq);
	}

	/*********************
	 * Slow Mode Defaults
	 */
	 /*
	if (data->slow.enabled) {
		PROFILE_WRITE("/sys/devices/virtual/sec/sec_slow/enforced_slow_mode", slow, mode_toggle);
		PROFILE_WRITE("/sys/devices/virtual/sec/sec_slow/timer_rate",         slow, timer_rate);
	} */

	/*********************
	 * Input-Booster Defaults
	 */
	/*
	if (data->input_booster.enabled) {
		PROFILE_WRITE("/sys/class/input_booster/tail", input_booster, tail);
		PROFILE_WRITE("/sys/class/input_booster/head", input_booster, head);
	} */

	

	auto end = Utils::getTime();
	auto diff = end - begin;

	ALOGV("%s: exit; took %lldms", __func__, diff.count());
}

void Power::setProfile(SecPowerProfiles profile, int delay) {
	DELAY(setProfile(profile), delay);
}

void Power::resetProfile(int delay) {
	if (mRequestedProfile == SecPowerProfiles::INVALID) {
		setProfile(SecPowerProfiles::BALANCED, delay);
	} else {
		setProfile(mRequestedProfile, delay);
	}
}

void Power::setInputState(bool enabled) {

}

void Power::setDT2WState() {
	if (mIsDT2WEnabled) {
		Utils::write(POWER_DT2W_ENABLED, 1);
	} else {
		Utils::write(POWER_DT2W_ENABLED, 0);
	}
}

bool Power::isModuleEnabled(string module) {
	return (GetProperty("sys.power." + module, "true") == "true");
}

} // namespace implementation
}  // namespace V1_0
}  // namespace power
}  // namespace hardware
}  // namespace android
