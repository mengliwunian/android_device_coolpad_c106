#
# Copyright 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

LOCAL_PATH := $(call my-dir)

ifneq ($(filter c106 c103 c1,$(TARGET_DEVICE)),)

include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

IMS_LIBS := libimscamera_jni.so libimsmedia_jni.so
IMS_SYMLINKS := $(addprefix $(TARGET_OUT)/vendor/app/ims/lib/arm64/,$(notdir $(IMS_LIBS)))
$(IMS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "IMS lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /vendor/lib64/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(IMS_SYMLINKS)

WCNSS_CFG_INI := $(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_cfg.ini
$(WCNSS_CFG_INI): $(LOCAL_INSTALLED_MODULE)
	@echo "WCNSS_qcom_cfg.ini firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /data/misc/wifi/$(notdir $@) $@

WCNSS_BIN_SYMLINK := $(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin
$(WCNSS_BIN_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "WCNSS_qcom_wlan_nv.bin firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/etc/wifi/$(notdir $@) $@

WCNSS_DICT_DAT := $(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_wlan_dictionary.dat
$(WCNSS_DICT_DAT): $(LOCAL_INSTALLED_MODULE)
	@echo "WCNSS_wlan_dictionary.dat firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /persist/$(notdir $@) $@

WCNSS_SDIO_CFG_INI := $(TARGET_OUT_ETC)/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini
$(WCNSS_SDIO_CFG_INI): $(LOCAL_INSTALLED_MODULE)
	@echo "WCNSS_qcom_sdio_cfg.ini firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/etc/wifi/WCNSS_qcom_sdio_cfg $@

ALL_DEFAULT_INSTALLED_MODULES += $(WCNSS_CFG_INI) $(WCNSS_BIN_SYMLINK) $(WCNSS_DICT_DAT) $(WCNSS_SDIO_CFG_INI)

# RFS symlinks
RFS_SYMLINKS := $(TARGET_OUT)/rfs
$(RFS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "RFS links"
	@rm -rf $(TARGET_OUT)/rfs 
	@mkdir -p $(TARGET_OUT)/rfs/apq/gnss/readonly
	$(hide) ln -sf /persist/hlos_rfs/shared $(TARGET_OUT)/rfs/apq/gnss/hlos
	$(hide) ln -sf /data/tombstones/modem $(TARGET_OUT)/rfs/apq/gnss/ramdumps
	$(hide) ln -sf /persist/rfs/apq/gnss $(TARGET_OUT)/rfs/apq/gnss/readwrite
	$(hide) ln -sf /persist/rfs/shared $(TARGET_OUT)/rfs/apq/gnss/shared
	$(hide) ln -sf /firmware $(TARGET_OUT)/rfs/apq/gnss/readonly/firmware
	@mkdir -p $(TARGET_OUT)/rfs/msm/adsp/readonly
	$(hide) ln -sf /persist/hlos_rfs/shared $(TARGET_OUT)/rfs/msm/adsp/hlos
	$(hide) ln -sf /data/tombstones/lpass $(TARGET_OUT)/rfs/msm/adsp/ramdumps
	$(hide) ln -sf /persist/rfs/msm/adsp $(TARGET_OUT)/rfs/msm/adsp/readwrite
	$(hide) ln -sf /persist/rfs/shared $(TARGET_OUT)/rfs/msm/adsp/shared
	$(hide) ln -sf /firmware $(TARGET_OUT)/rfs/msm/adsp/readonly/firmware
	@mkdir -p $(TARGET_OUT)/rfs/msm/mpss/readonly
	$(hide) ln -sf /persist/hlos_rfs/shared $(TARGET_OUT)/rfs/msm/mpss/hlos
	$(hide) ln -sf /data/tombstones/modem $(TARGET_OUT)/rfs/msm/mpss/ramdumps
	$(hide) ln -sf /persist/rfs/msm/mpss $(TARGET_OUT)/rfs/msm/mpss/readwrite
	$(hide) ln -sf /persist/rfs/shared $(TARGET_OUT)/rfs/msm/mpss/shared
	$(hide) ln -sf /firmware $(TARGET_OUT)/rfs/msm/mpss/readonly/firmware
	@mkdir -p $(TARGET_OUT)/rfs/mdm/adsp/readonly
	$(hide) ln -sf /persist/hlos_rfs/shared $(TARGET_OUT)/rfs/mdm/adsp/hlos
	$(hide) ln -sf /data/tombstones/lpass $(TARGET_OUT)/rfs/mdm/adsp/ramdumps
	$(hide) ln -sf /persist/rfs/mdm/adsp $(TARGET_OUT)/rfs/mdm/adsp/readwrite
	$(hide) ln -sf /persist/rfs/shared $(TARGET_OUT)/rfs/mdm/adsp/shared
	$(hide) ln -sf /firmware $(TARGET_OUT)/rfs/mdm/adsp/readonly/firmware
	@mkdir -p $(TARGET_OUT)/rfs/mdm/mpss/readonly
	$(hide) ln -sf /persist/hlos_rfs/shared $(TARGET_OUT)/rfs/mdm/mpss/hlos
	$(hide) ln -sf /data/tombstones/modem $(TARGET_OUT)/rfs/mdm/mpss/ramdumps
	$(hide) ln -sf /persist/rfs/msm/mpss $(TARGET_OUT)/rfs/mdm/mpss/readwrite
	$(hide) ln -sf /persist/rfs/shared $(TARGET_OUT)/rfs/mdm/mpss/shared
	$(hide) ln -sf /firmware $(TARGET_OUT)/rfs/mdm/mpss/readonly/firmware
	@mkdir -p $(TARGET_OUT)/rfs/mdm/sparrow/readonly
	$(hide) ln -sf /persist/hlos_rfs/shared $(TARGET_OUT)/rfs/mdm/sparrow/hlos
	$(hide) ln -sf /data/tombstones/sparrow $(TARGET_OUT)/rfs/mdm/sparrow/ramdumps
	$(hide) ln -sf /persist/rfs/mdm/sparrow $(TARGET_OUT)/rfs/mdm/sparrow/readwrite
	$(hide) ln -sf /persist/rfs/shared $(TARGET_OUT)/rfs/mdm/sparrow/shared
	$(hide) ln -sf /firmware $(TARGET_OUT)/rfs/mdm/sparrow/readonly/firmware

ALL_DEFAULT_INSTALLED_MODULES += $(RFS_SYMLINKS)

endif
