#
# Copyright (C) 2025 JoshuaDoes
#

include $(TOPDIR)/rules.mk

TENSOR_PRODUCT:=lynx
TENSOR_KERNEL_COMMIT:=3102344d0cd560bfe33cbfa228856350e1254c18
TENSOR_KERNEL_SHA256:=skip

PKG_NAME:=tensor-kernel-prebuilt-$(TENSOR_PRODUCT)
PKG_VERSION:=6.1.128
KERNEL_VERSION:=$(PKG_VERSION)
PKG_RELEASE:=$(PKG_VERSION)-r1
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/hentaiOS-Devices/device_google_$(TENSOR_PRODUCT)-kernel
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
	( if [ ! -f $(STAGING_DIR_IMAGE)/$(TENSOR_PRODUCT)-boot.img ]; then \
		echo "*** Please install a boot image for $(TENSOR_PRODUCT) containing Linux $(KERNEL_VERSION) before building $(PKG_NAME) ***"; \
		echo "Expected: $(STAGING_DIR_IMAGE)/$(TENSOR_PRODUCT)-boot.img"; \
		exit 1; \
	fi )

	$(INSTALL_DIR) $(1)/lib/modules/tensor
	rm -rf $(1)/lib/modules/tensor/
	mkdir -p $(1)/lib/modules/tensor/
	$(CP) $(PKG_BUILD_DIR)/*.ko $(1)/lib/modules/tensor/

	$(INSTALL_DIR) $(1)/etc
	rm -f $(1)/etc/modules.load
	( if [ -f $(PKG_BUILD_DIR)/vendor_boot.modules.load ]; then \
		cat $(PKG_BUILD_DIR)/vendor_boot.modules.load >> $(1)/etc/modules.load; \
	fi )
	( if [ -f $(PKG_BUILD_DIR)/modules.load ]; then \
		cat $(PKG_BUILD_DIR)/modules.load >> $(1)/etc/modules.load; \
	fi )
endef

define Build/Compile
	true
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
