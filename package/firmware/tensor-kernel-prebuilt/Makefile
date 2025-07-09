#
# Copyright (C) 2025 JoshuaDoes
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/package.mk

PKG_NAME:=tensor-kernel-prebuilt
PKG_VERSION:=1.0
PKG_RELEASE:=1

define TensorKernelPrebuilt
  define Package/tensor-kernel-prebuilt-$(1)
    SECTION:=kernel
    CATEGORY:=Kernel modules
    TITLE:=Prebuilt kernels, device trees and modules for Google Tensor on $(1)
    VARIANT:=$(1)
    CHECKOUT:=$(2)
  endef

  define Package/tensor-kernel-prebuilt-$(1)/install
	$(INSTALL_DIR) $$(1)/lib/modules
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/$(1)/*.ko $$(1)/lib/modules/

	$(INSTALL_DIR) $$(1)/etc
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/$(1)/modules.load $$(1)/etc/modules.load

	$(INSTALL_DIR) $$(STAGING_DIR_IMAGE)
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/Image.lz4 $(STAGING_DIR_IMAGE)/$(1)-Image.lz4
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/dtbo.img $(STAGING_DIR_IMAGE)/$(1)-dtbo.img
  endef

  $$(eval $$(call BuildPackage,tensor-kernel-prebuilt-$(1)))
endef

$(eval $(call TensorKernelPrebuilt,$(TENSOR_PRODUCT),$(TENSOR_CHECKOUT)))

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/hentaiOS-Devices/device_google_$(VARIANT)-kernel.git
PKG_SOURCE_VERSION:=HEAD
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(VARIANT).tar.gz

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)-$(VARIANT)
PKG_BUILD_PARALLEL := 0
PKG_BUILD_DEPENDS :=
PKG_FLAGS := nonshared

define Build/Compile
	true
endef
