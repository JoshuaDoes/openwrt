#
# Copyright (C) 2025 JoshuaDoes
#

# Helper includes
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk

# Utilities
mkbootimg := $(STAGING_DIR_HOST)/bin/mkbootimg
HOST_DEPENDS += mkbootimg

# Devices
define Device/Default
	PROFILES = Default
endef
define Device/tensor
	DEVICE_VENDOR := Google
	IMAGES := boot.img
	IMAGE/boot.img := tensor
endef
include $(SUBTARGET).mk

# fastboot
define Build/fastboot
	@echo "[fastboot] Building ramdisk..."
	( cd $(TARGET_DIR); find . | $(STAGING_DIR_HOST)/bin/cpio -o -H newc -R 0:0 | lz4 -l > $(BIN_DIR)/$(IMG_ROOTFS).cpio.lz4 )
	@echo "[fastboot] Built ramdisk: $(BIN_DIR)/$(IMG_ROOTFS).cpio.lz4"

	@echo "[fastboot] Building image..."
	$(mkbootimg) \
		--kernel $(1) \
		--ramdisk $(BIN_DIR)/$(IMG_ROOTFS).cpio.lz4 \
                --dtb $(2) \
		--board $(3) \
		--base $(4) \
		--pagesize $(5) \
		--cmdline "$(6)" \
		--kernel_offset $(7) \
		--ramdisk_offset $(8) \
		--header_version $(9) \
		--output $(10)
	@echo "[fastboot] Built image: $(10)"
endef

# Fastboot support
TARGET_FILESYSTEMS += fastboot
fs-types-y += fastboot

# Tensor
define Build/tensor
	@echo "[tensor] Using kernel: $(STAGING_DIR_IMAGE)/$(TENSOR_PRODUCT)-Image.lz4"
	@echo "[tensor] Using dtb: $(STAGING_DIR_IMAGE)/$(TENSOR_PRODUCT)-dtbo.img"
	@echo "[tensor] Using output: $@"
	@echo "[tensor] Building fastboot image for $(SUBTARGET)..."
	$(call Build/fastboot,$(STAGING_DIR_IMAGE)/$(TENSOR_PRODUCT)-Image.lz4,$(STAGING_DIR_IMAGE)/$(TENSOR_PRODUCT)-dtbo.img,$(SUBTARGET),$(TENSOR_BASE),$(TENSOR_PAGESIZE),$(TENSOR_CMDLINE),$(TENSOR_OFFSET_KERNEL),$(TENSOR_OFFSET_RAMDISK),$(TENSOR_HEADER),$@)
endef

# Image
define Image/Prepare
	@echo "[tensor] Preparing fastboot image build"
	@touch $(KDIR)/root.fastboot
endef
define Image/Build/fastboot
	$(call Build/tensor,$(BIN_DIR)/$(IMG_PREFIX)-boot.img)
endef
define Image/Build
	@echo "[tensor] Default Image/Build called with fs: $(1)"
endef

# Exports
DEVICE_VARS += \
	TENSOR_PRODUCT \
	TENSOR_CMDLINE \
	TENSOR_BASE \
	TENSOR_PAGESIZE \
	TENSOR_OFFSET_KERNEL \
	TENSOR_OFFSET_RAMDISK \
	TENSOR_HEADER

# Start building
$(eval $(call BuildImage))
