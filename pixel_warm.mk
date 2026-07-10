#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from warm device
$(call inherit-product, device/xiaomi/warm/device.mk)

# Device identifiers
PRODUCT_DEVICE := warm
PRODUCT_NAME := lineage_warm
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 24116RNC1I
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="warm_global-user 16 BP2A.250605.031.A3 OS3.0.3.0.WGVINXM release-keys" \
    BuildFingerprint=Redmi/warm_global/warm:16/BP2A.250605.031.A3/OS3.0.3.0.WGVINXM:user/release-keys \
    DeviceName=warm_global \
    DeviceProduct=warm

# GMS
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
