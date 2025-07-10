#
# Copyright (C) 2025 JoshuaDoes
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/package.mk

TENSOR_TARGET := pantah
TENSOR_KERNEL_COMMIT := 29cfade3d8f2885a5c53e08a44d09650eef23c49
TENSOR_KERNEL_SHA256 := skip

PKG_NAME:=tensor-kernel-prebuilt-$(TENSOR_TARGET)
PKG_SECTION:=kernel
PKG_CATEGORY:=Kernel modules
PKG_TITLE:=Prebuilt kernels, device trees and modules for Google Tensor on $(TENSOR_TARGET)
PKG_VERSION:=1.0
PKG_RELEASE:=1
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/hentaiOS-Devices/device_google_$(TENSOR_TARGET)-kernel.git
PKG_SOURCE_VERSION:=$(TENSOR_KERNEL_COMMIT)
PKG_SOURCE_HASH:=$(TENSOR_KERNEL_SHA256)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(TENSOR_TARGET).tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(TENSOR_TARGET)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_BUILD_PARALLEL:=0
PKG_FLAGS:=nonshared

define Package/$(PKG_NAME)
  SECTION:=$(PKG_SECTION)
  CATEGORY:=$(PKG_CATEGORY)
  TITLE:=$(PKG_TITLE)
endef

define Package/$(PKG_NAME)/install
	@echo "[tensor] Installing prebuilt kernel for $(TENSOR_TARGET)"

	$(INSTALL_DIR) $(1)/lib/modules
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/*.ko $(1)/lib/modules/

	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/modules.load $(1)/etc/

	$(INSTALL_DIR) $(STAGING_DIR_IMAGE)
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/Image.lz4 $(STAGING_DIR_IMAGE)/$(TENSOR_TARGET)-Image.lz4
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/dtbo.img $(STAGING_DIR_IMAGE)/$(TENSOR_TARGET)-dtbo.img
endef

$(call BuildPackage,$(PKG_NAME))
