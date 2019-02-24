#
# Copyright (C) 2017 The Mokee Project
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

# Boot animation
TARGET_SCREEN_HEIGHT := 1080
TARGET_SCREEN_WIDTH := 1920

# Inherit 64-bit configs
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Mokee stuff.
$(call inherit-product, vendor/mk/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/coolpad/c106/device.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.mk.maintainer=glory

# MKHW
BOARD_HARDWARE_CLASS += \
    $(DEVICE_PATH)/mkhw

# MKHW
BOARD_USES_MOKEE_HARDWARE := true
BOARD_HARDWARE_CLASS += \
    hardware/mokee/mkhw

# Device identifier. This must come after all inclusions
PRODUCT_NAME := mk_c106
PRODUCT_DEVICE := c106
PRODUCT_BRAND := coolpad
PRODUCT_MODEL := CoolPad C106
PRODUCT_MANUFACTURER := coolpad

PRODUCT_GMS_CLIENTID_BASE := android-coolpad

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=Coolpad/VCR-A0/C106:7.1.1/C106CN00X1000MPX1706260/buildfsz_05-283:user/release-keys \
    PRIVATE_BUILD_DESC="C106CN00X1000MPX1706260 C106-user 7.1.1 eng.buildf.20170626.135425 release-keys" \
    TARGET_DEVICE="C106"
