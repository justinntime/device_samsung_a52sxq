#
# Copyright (C) 2023 The LineageOS Project
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

DEVICE_PATH := device/samsung/a52sxq

# Derp Flags
DERP_BUILDTYPE := Official
DERP_VERSION_APPEND_TIME_OF_DAY := true
EXTRA_UDFPS_ICONS := true
TARGET_NOT_USES_BLUR := true
TARGET_SUPPORTS_QUICK_TAP := true

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay

# Remove Packages
PRODUCT_PACKAGES += \
    RemovePackages

# call the common setup
$(call inherit-product, device/samsung/sm7325-common/common.mk)

# call the proprietary setup
$(call inherit-product, vendor/samsung/a52sxq/a52sxq-vendor.mk)

# Init files
PRODUCT_PACKAGES += \
    init.a52sxq.rc

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(DEVICE_PATH)/configs/audio/audio_platform_info_diff.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_diff.xml \

# Quick Tap
PRODUCT_PACKAGES += \
    ColumbusService

# Sensors
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

PRODUCT_PACKAGES += \
    sensors.a52sxq
