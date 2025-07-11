#
# Copyright (C) 2025 JoshuaDoes
#

# Image tools
HOST_DEPENDS += mkbootimg magiskboot
mkbootimg := $(STAGING_DIR_HOST)/bin/mkbootimg
unpackbootimg := $(STAGING_DIR_HOST)/bin/unpackbootimg
magiskboot := $(STAGING_DIR_HOST)/bin/magiskboot

# Repack firmware images with new contents
# 1: boot.img
# 2: boot/
# 3: boot-new.img
define Build/fastboot/magiskboot/unpack
	( mkdir -p $(2); cd $(2); $(magiskboot) unpack -h $(1) )
endef
define Build/fastboot/magiskboot/repack
	( cd $(2); $(magiskboot) repack $(1) $(3) )
endef

# Build firmware images compatible with fastboot
TARGET_FILESYSTEMS += fastboot
fs-types-y += fastboot
define Image/Prepare
	@echo "[fastboot] Preparing to build a fastboot image"
	@touch $(KDIR)/root.fastboot
endef

# Resize images to their full width
define Build/fastboot/pad
	@echo "[fastboot] Resizing image to $(IMAGE_SIZE)..."
        dd if=$@ of=$@.new bs=$(IMAGE_SIZE) conv=sync
        mv $@.new $@
endef

# Build boot.img
define Build/fastboot/boot/4
	@echo "[fastboot] Building boot v4 image..."
	@echo "[fastboot] > Using board: $(1)"
	@echo "[fastboot] > Using pagesize: $(2)"
	@echo "[fastboot] > Using offset base: $(3)"
	@echo "[fastboot] > Using offset dtb: $(4)"
	@echo "[fastboot] > Using offset kernel: $(5)"
	@echo "[fastboot] > Using offset ramdisk: $(6)"
	@echo "[fastboot] > Using offset tags: $(7)"
	@echo "[fastboot] > Using kernel: $(8)"
	@echo "[fastboot] > Using ramdisk: $(9)"
	@echo "[fastboot] > Using dtb: $(10)"
	@echo "[fastboot] > Using cmdline: $(11)"
	@echo "[fastboot] > Using output: $(12)"
	$(mkbootimg) \
		--header_version 4 \
		--board "$(1)" \
		--pagesize $(2) \
		--base $(3) \
		--dtb_offset $(4) \
		--kernel_offset $(5) \
		--ramdisk_offset $(6) \
		--tags_offset $(7) \
		--kernel $(8) \
		--ramdisk $(9) \
		--dtb $(10) \
		--cmdline "$(11)" \
		--output $(12)
	@echo "[fastboot] Built boot v4 image: $(12)"
endef

# Build vendor_boot.img
define Build/fastboot/vendor_boot/4
	@echo "[fastboot] Building vendor_boot v4 image..."
	@echo "[fastboot] > Using board: $(1)"
	@echo "[fastboot] > Using pagesize: $(2)"
	@echo "[fastboot] > Using offset base: $(3)"
	@echo "[fastboot] > Using offset dtb: $(4)"
	@echo "[fastboot] > Using offset kernel: $(5)"
	@echo "[fastboot] > Using offset ramdisk: $(6)"
	@echo "[fastboot] > Using offset tags: $(7)"
	@echo "[fastboot] > Using kernel: $(8)"
	@echo "[fastboot] > Using ramdisk: $(9)"
	@echo "[fastboot] > Using dtb: $(10)"
	@echo "[fastboot] > Using cmdline: $(11)"
	@echo "[fastboot] > Using output: $(12)"
	$(mkbootimg) \
		--header_version 4 \
		--board "$(1)" \
		--pagesize $(2) \
		--base $(3) \
		--dtb_offset $(4) \
		--kernel_offset $(5) \
		--ramdisk_offset $(6) \
		--tags_offset $(7) \
		--kernel $(8) \
		--vendor_ramdisk $(9) \
		--dtb $(10) \
		--vendor_cmdline "$(11)" \
		--vendor_boot $(12)
	@echo "[fastboot] Built vendor_boot v4 image: $(12)"
endef
