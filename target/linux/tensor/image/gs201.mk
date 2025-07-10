#
# Copyright (C) 2025 JoshuaDoes
#

define Device/google_panther
  $(call Device/tensor)
  DEVICE_MODEL := Pixel 7
  DEVICE_PACKAGES := tensor-kernel-prebuilt-pantah
  TENSOR_PRODUCT := pantah
endef
TARGET_DEVICES += google_panther

define Device/google_cheetah
  $(call Device/tensor)
  DEVICE_MODEL := Pixel 7 Pro
  DEVICE_PACKAGES := tensor-kernel-prebuilt-pantah
  TENSOR_PRODUCT := pantah
endef
TARGET_DEVICES += google_cheetah

define Device/google_lynx
  $(call Device/tensor)
  DEVICE_MODEL := Pixel 7a
  DEVICE_PACKAGES := tensor-kernel-prebuilt-lynx
  TENSOR_PRODUCT := lynx
endef
TARGET_DEVICES += google_lynx
