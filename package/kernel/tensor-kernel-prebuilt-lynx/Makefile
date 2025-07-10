#
# Copyright (C) 2025 JoshuaDoes
#

include $(TOPDIR)/rules.mk

TENSOR_TARGET:=lynx
TENSOR_KERNEL_COMMIT:=3102344d0cd560bfe33cbfa228856350e1254c18
TENSOR_KERNEL_SHA256:=skip

PKG_NAME:=tensor-kernel-prebuilt-$(TENSOR_TARGET)
PKG_VERSION:=6.1.128
PKG_RELEASE:=$(PKG_VERSION)-r1
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/hentaiOS-Devices/device_google_$(TENSOR_TARGET)-kernel.git
PKG_SOURCE_VERSION:=ff96f402ce6f3be87cb40a16f33ac62d69cdb16a
PKG_SOURCE_HASH:=b0b0b7acce6f062e1f6d919fa56afe3eb84be04671a09dcc2fc7fbeccb0fca97
PKG_SOURCE:=$(PKG_NAME).tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_BUILD_PARALLEL:=0
PKG_FLAGS:=nonshared

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=kernel
  CATEGORY:=Kernel modules
  TITLE:=Tensor kernel prebuilts for $(TENSOR_TARGET)
  MAINTAINER:=JoshuaDoes using hentaiOS
  VERSION:=$(PKG_VERSION)
  URL:=$(PKG_SOURCE_URL)
endef

define Package/$(PKG_NAME)/description
	Prebuilt kernels, device trees and modules for Google Tensor on $(TENSOR_TARGET)
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/lib/modules
	$(CP) $(PKG_BUILD_DIR)/*.ko $(1)/lib/modules/

	$(INSTALL_DIR) $(1)/etc
	$(CP) $(PKG_BUILD_DIR)/modules.load $(1)/etc/

	$(INSTALL_DIR) $(STAGING_DIR_IMAGE)
	$(CP) $(PKG_BUILD_DIR)/Image.lz4 $(STAGING_DIR_IMAGE)/$(TENSOR_TARGET)-Image.lz4
	$(CP) $(PKG_BUILD_DIR)/dtbo.img $(STAGING_DIR_IMAGE)/$(TENSOR_TARGET)-dtbo.img
endef

define Build/Compile
	true
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
