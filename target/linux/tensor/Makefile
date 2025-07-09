#
# Copyright (C) 2025 JoshuaDoes
#

include $(TOPDIR)/rules.mk

# CPU
ARCH:=aarch64
CPU_TYPE:=cortex-a55

# Features
FEATURES:=usb ramdisk

# Target
BOARD:=tensor
BOARDNAME:=Google Tensor
SUBTARGETS:=gs101 gs201 zuma
FILES:=base-files

# Fake kernel
KERNEL_PATCHVER:=6.6
KERNEL_TESTING_PATCHVER:=6.6

define Target/Description
	Build firmware images for Google Tensor boards.
endef

include $(INCLUDE_DIR)/target.mk

$(eval $(call BuildTarget))
