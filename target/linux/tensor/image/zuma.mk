#
# Copyright (C) 2025 JoshuaDoes
#

define Device/google_shiba
  $(call Device/tensor)
  DEVICE_MODEL := Pixel 8
  DEVICE_PACKAGES := tensor-kernel-prebuilt-shusky
  TENSOR_PRODUCT := shusky
endef
TARGET_DEVICES += google_shiba

define Device/google_husky
  $(call Device/tensor)
  DEVICE_MODEL := Pixel 8 Pro
  DEVICE_PACKAGES := tensor-kernel-prebuilt-shusky
  TENSOR_PRODUCT := shusky
endef
TARGET_DEVICES += google_husky
