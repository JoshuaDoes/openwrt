#
# Copyright (C) 2025 JoshuaDoes
#

# Used when building the firmware images
DEVICE_VARS += \
	TENSOR_PRODUCT \
	IMAGE_SIZE

# Device defaults
define Device/Default
  PROFILES = Default
endef
define Device/tensor
  # Device definitions
  DEVICE_VENDOR := Google
  DEVICE_MODEL := Unknown
  TENSOR_PRODUCT := unknown

  # Firmware images
  IMAGES := ramdisk.cpio boot.img
  IMAGE/ramdisk.cpio := tensor/ramdisk
  IMAGE/boot.img := tensor/boot
  IMAGE_SIZE := 67108864
endef

# ramdisk.cpio
define Build/tensor/ramdisk
	@echo "[tensor] Building ramdisk..."
	@echo "[tensor] > Using output: $@"
	( cd $(TARGET_DIR); find . | $(STAGING_DIR_HOST)/bin/cpio -o -H newc -R 0:0 > $@ )
	@echo "[tensor] Built ramdisk: $@"
endef

# boot.img
define Build/tensor/boot
	@echo "[tensor] Repacking boot image for $(TENSOR_PRODUCT)..."
	rm -rf $(STAGING_DIR_IMAGE)/$(TENSOR_PRODUCT)-boot
	$(call Build/fastboot/magiskboot/unpack,$(STAGING_DIR_IMAGE)/$(TENSOR_PRODUCT)-boot.img,$(STAGING_DIR_IMAGE)/$(TENSOR_PRODUCT)-boot)
	cp $(BIN_DIR)/$(IMG_PREFIX)$(if $(PROFILE_SANITIZED),-$(PROFILE_SANITIZED))-fastboot-ramdisk.cpio $(STAGING_DIR_IMAGE)/$(TENSOR_PRODUCT)-boot/ramdisk.cpio
	$(call Build/fastboot/magiskboot/repack,$(STAGING_DIR_IMAGE)/$(TENSOR_PRODUCT)-boot.img,$(STAGING_DIR_IMAGE)/$(TENSOR_PRODUCT)-boot,$@)
	@echo "[tensor] Built boot image: $@"
endef
