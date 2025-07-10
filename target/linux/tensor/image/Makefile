#
# Copyright (C) 2025 JoshuaDoes
#

# Helper includes
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk

# mkbootimg
HOST_DEPENDS += mkbootimg
mkbootimg := $(STAGING_DIR_HOST)/bin/mkbootimg
unpackbootimg := $(STAGING_DIR_HOST)/bin/unpackbootimg

# Devices
define Device/Default
  PROFILES = Default
endef
define Device/tensor
  DEVICE_VENDOR := Google
  DEVICE_MODEL := Unknown

  TENSOR_PRODUCT := unknown
  TENSOR_PAGESIZE := 4096
  TENSOR_OS := 0.0.0
  TENSOR_PATCH := 0-00

  IMAGES := boot.img
  IMAGE/boot.img := tensor/image/ramdisk | tensor/image/unpack | tensor/image/pack | pad-to 67108864
endef
include $(SUBTARGET).mk

# fastboot
define Build/fastboot/boot/4
	@echo "[fastboot] Building boot v4 image..."
	$(mkbootimg) \
		--header_version 4 \
		--kernel $(1) \
		--ramdisk $(2) \
		--pagesize $(3) \
		--os_version $(4) \
		--os_patch_level $(5) \
		--output $(6)
	@echo "[fastboot] Built boot v4 image: $(6)"
endef

# Image
TARGET_FILESYSTEMS += fastboot
fs-types-y += fastboot
define Image/Prepare
	@echo "[tensor] Preparing fastboot image build"
	@touch $(KDIR)/root.fastboot
endef
define Build/tensor/image/ramdisk
	@echo "[tensor] Using output: $(BIN_DIR)/$(TENSOR_PRODUCT)-ramdisk.cpio.lz4"
	@echo "[tensor] Building ramdisk..."
	( cd $(TARGET_DIR); find . | $(STAGING_DIR_HOST)/bin/cpio -o -H newc -R 0:0 | lz4 -l > $(BIN_DIR)/$(TENSOR_PRODUCT)-ramdisk.cpio.lz4 )
	@echo "[tensor] Built ramdisk: $(BIN_DIR)/$(TENSOR_PRODUCT)-ramdisk.cpio.lz4"
endef
define Build/tensor/image/unpack
	$(unpackbootimg) -i $(STAGING_DIR_IMAGE)/boot.img -o $(STAGING_DIR_IMAGE)
endef
define Build/tensor/image/pack
	@echo "[tensor] Using kernel: $(STAGING_DIR_IMAGE)/boot.img-kernel"
	@echo "[tensor] Using ramdisk: $(BIN_DIR)/$(TENSOR_PRODUCT)-ramdisk.cpio.lz4"
	@echo "[tensor] Using output: $@"
	@echo "[tensor] Building fastboot boot v4 image for $(TENSOR_PRODUCT)..."
	$(call Build/fastboot/boot/4,$(STAGING_DIR_IMAGE)/boot.img-kernel,$(BIN_DIR)/$(TENSOR_PRODUCT)-ramdisk.cpio.lz4,$(TENSOR_PAGESIZE),$(TENSOR_OS),$(TENSOR_PATCH),$@)
endef

# Exports
DEVICE_VARS += \
	TENSOR_PRODUCT \
	TENSOR_PAGESIZE \
	TENSOR_OS \
	TENSOR_PATCH

# Start building
$(eval $(call BuildImage))
