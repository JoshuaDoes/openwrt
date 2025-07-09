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

$(eval $(call TensorKernelPrebuilt,raviole,ff96f402ce6f3be87cb40a16f33ac62d69cdb16a))
$(eval $(call TensorKernelPrebuilt,bluejay,f8676058a939195f75e748184aeea572a6a522bf))
$(eval $(call TensorKernelPrebuilt,pantah,29cfade3d8f2885a5c53e08a44d09650eef23c49))
$(eval $(call TensorKernelPrebuilt,lynx,3102344d0cd560bfe33cbfa228856350e1254c18))
$(eval $(call TensorKernelPrebuilt,shusky,ceafd141081c88e0e5f256b1661d74cb989da5ae))

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/hentaiOS-Devices/device_google_$(VARIANT)-kernel.git
PKG_SOURCE_VERSION:=$(CHECKOUT)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(VARIANT).tar.gz

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)-$(VARIANT)
PKG_BUILD_PARALLEL := 0
PKG_BUILD_DEPENDS :=
PKG_FLAGS := nonshared

define Build/Compile
	true
endef
