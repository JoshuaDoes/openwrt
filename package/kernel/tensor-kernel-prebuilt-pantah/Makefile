#
# Copyright (C) 2025 JoshuaDoes
#

include $(TOPDIR)/rules.mk

TENSOR_PRODUCT:=pantah
TENSOR_KERNEL_COMMIT:=29cfade3d8f2885a5c53e08a44d09650eef23c49
TENSOR_KERNEL_SHA256:=skip

PKG_NAME:=tensor-kernel-prebuilt-$(TENSOR_PRODUCT)
PKG_VERSION:=6.1.128
PKG_RELEASE:=$(PKG_VERSION)-r1
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/hentaiOS-Devices/device_google_$(TENSOR_PRODUCT)-kernel.git
PKG_SOURCE_DATE:=2025-05-08
PKG_SOURCE_VERSION:=$(TENSOR_KERNEL_COMMIT)
PKG_MIRROR_HASH:=$(TENSOR_KERNEL_SHA256)
PKG_SOURCE:=$(PKG_NAME).tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_BUILD_PARALLEL:=0
PKG_FLAGS:=nonshared

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=kernel
  CATEGORY:=Kernel modules
  TITLE:=Tensor kernel prebuilts for $(TENSOR_PRODUCT)
  MAINTAINER:=JoshuaDoes using hentaiOS
  VERSION:=$(PKG_VERSION)
  URL:=$(PKG_SOURCE_URL)
endef

define Package/$(PKG_NAME)/description
	Prebuilt kernels, device trees and modules for Google Tensor on $(TENSOR_PRODUCT)
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/lib/modules
	$(CP) $(PKG_BUILD_DIR)/*.ko $(1)/lib/modules/

	$(INSTALL_DIR) $(1)/etc
	$(CP) $(PKG_BUILD_DIR)/vendor_boot.modules.load $(1)/etc/modules.load

	$(INSTALL_DIR) $(STAGING_DIR_IMAGE)
	rm $(STAGING_DIR_IMAGE)/$(TENSOR_PRODUCT).dtb
	find $(PKG_BUILD_DIR) -name '*.dtb' | sort | xargs cat >> $(STAGING_DIR_IMAGE)/$(TENSOR_PRODUCT).dtb
	$(CP) $(PKG_BUILD_DIR)/Image.lz4 $(STAGING_DIR_IMAGE)/$(TENSOR_PRODUCT)-Image.lz4
endef

define Build/Compile
	true
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
