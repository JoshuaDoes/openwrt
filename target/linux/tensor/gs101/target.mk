#
# Copyright (C) 2025 JoshuaDoes
#

# CPU
ARCH:=aarch64
CPU_TYPE:=cortex-a55

# Target
BOARDNAME:=Google Tensor G1 (gs101)
SUBTARGET:=gs101

define Target/Description
	Build firmware images for Google Tensor G1 (gs101) devices.
endef
