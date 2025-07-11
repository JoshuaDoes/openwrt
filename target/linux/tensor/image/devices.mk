#
# Copyright (C) 2025 JoshuaDoes
#

# Tensor G1: gs101
define Device/raviole
  $(call Device/tensor)
  DEVICE_PACKAGES := tensor-kernel-prebuilt-raviole
  TENSOR_PRODUCT := raviole
endef
define Device/google_oriole
  $(call Device/raviole)
  DEVICE_MODEL := Pixel 6
endef
define Device/google_raven
  $(call Device/raviole)
  DEVICE_MODEL := Pixel 6 Pro
endef
define Device/google_bluejay
  $(call Device/tensor)
  DEVICE_MODEL := Pixel 6a
  DEVICE_PACKAGES := tensor-kernel-prebuilt-bluejay
  TENSOR_PRODUCT := bluejay
endef
TARGET_DEVICES += google_oriole google_raven google_bluejay

# Tensor G2: gs201
define Device/pantah
  $(call Device/tensor)
  DEVICE_PACKAGES := tensor-kernel-prebuilt-pantah
  TENSOR_PRODUCT := pantah
endef
define Device/google_panther
  $(call Device/pantah)
  DEVICE_MODEL := Pixel 7
endef
define Device/google_cheetah
  $(call Device/pantah)
  DEVICE_MODEL := Pixel 7 Pro
endef
define Device/google_lynx
  $(call Device/tensor)
  DEVICE_MODEL := Pixel 7a
  DEVICE_PACKAGES := tensor-kernel-prebuilt-lynx
  TENSOR_PRODUCT := lynx
endef
TARGET_DEVICES += google_panther google_cheetah google_lynx

# Tensor G3: zuma
define Device/shusky
  $(call Device/tensor)
  DEVICE_PACKAGES := tensor-kernel-prebuilt-shusky
  TENSOR_PRODUCT := shusky
endef
define Device/google_shiba
  $(call Device/shusky)
  DEVICE_MODEL := Pixel 8
endef
define Device/google_husky
  $(call Device/shusky)
  DEVICE_MODEL := Pixel 8 Pro
endef
TARGET_DEVICES += google_shiba google_husky
