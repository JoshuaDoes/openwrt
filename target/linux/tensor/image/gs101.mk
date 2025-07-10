#
# Copyright (C) 2025 JoshuaDoes
#

define Device/google_oriole
  $(call Device/tensor)
  DEVICE_MODEL := Pixel 6
  DEVICE_PACKAGES := tensor-kernel-prebuilt-raviole
  TENSOR_PRODUCT := raviole
endef
TARGET_DEVICES += google_oriole

define Device/google_raven
  $(call Device/tensor)
  DEVICE_MODEL := Pixel 6 Pro
  DEVICE_PACKAGES := tensor-kernel-prebuilt-raviole
  TENSOR_PRODUCT := raviole
endef
TARGET_DEVICES += google_raven

define Device/google_bluejay
  $(call Device/tensor)
  DEVICE_MODEL := Pixel 6a
  DEVICE_PACKAGES := tensor-kernel-prebuilt-bluejay
  TENSOR_PRODUCT := bluejay
endef
TARGET_DEVICES += google_bluejay
