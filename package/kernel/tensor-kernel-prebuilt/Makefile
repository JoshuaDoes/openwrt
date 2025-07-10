#
# Copyright (C) 2025 JoshuaDoes
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/package.mk

define TensorKernelPrebuilt
	define Package/$$(PKG_NAME)-$(1)
		SECTION:=kernel
		CATEGORY:=Kernel modules
		TITLE:=Prebuilt kernels, device trees and modules for Google Tensor on $(1)
		VARIANT:=$(1)
	endef

	define Package/$$(PKG_NAME)-$(1)/install
		$(INSTALL_DIR) $$(1)/lib/modules
		$(INSTALL_DIR) $$(1)/etc
		$(INSTALL_DIR) $(STAGING_DIR_IMAGE)

		$(INSTALL_DATA) $(PKG_BUILD_DIR)/*.ko $$(1)/lib/modules/
		$(INSTALL_DATA) $(PKG_BUILD_DIR)/modules.load $$(1)/etc/
		$(INSTALL_DATA) $(PKG_BUILD_DIR)/Image.lz4 $(STAGING_DIR_IMAGE)/$(1)-Image.lz4
		$(INSTALL_DATA) $(PKG_BUILD_DIR)/dtbo.img $(STAGING_DIR_IMAGE)/$(1)-dtbo.img
	endef

	$$(eval $$(call BuildPackage,tensor-kernel-prebuilt-$(1)))
endef

define Build/Compile
	@echo "[tensor] Building tensor-kernel-prebuilt variant: $(VARIANT)"
endef

PKG_NAME:=tensor-kernel-prebuilt
PKG_VERSION:=1.0
PKG_RELEASE:=1
PKG_BUILD_PARALLEL:=0
PKG_FLAGS:=nonshared
PKG_SOURCE_PROTO:=git

# Google Pixel 6 / 6 Pro
PKG_SOURCE_URL:=https://github.com/hentaiOS-Devices/device_google_raviole-kernel.git
PKG_SOURCE_VERSION:=ff96f402ce6f3be87cb40a16f33ac62d69cdb16a
PKG_SOURCE_HASH:=b0b0b7acce6f062e1f6d919fa56afe3eb84be04671a09dcc2fc7fbeccb0fca97
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-raviole.tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-raviole
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-raviole
$(eval $(call TensorKernelPrebuilt,raviole))

# Google Pixel 6a
PKG_SOURCE_URL:=https://github.com/hentaiOS-Devices/device_google_bluejay-kernel.git
PKG_SOURCE_VERSION:=f8676058a939195f75e748184aeea572a6a522bf
PKG_SOURCE_HASH:=skip
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-bluejay.tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-bluejay
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-bluejay
$(eval $(call TensorKernelPrebuilt,bluejay))

# Google Pixel 7 / 7 Pro
PKG_SOURCE_URL:=https://github.com/hentaiOS-Devices/device_google_pantah-kernel.git
PKG_SOURCE_VERSION:=29cfade3d8f2885a5c53e08a44d09650eef23c49
PKG_SOUCE_HASH:=skip
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-pantah.tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-pantah
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-pantah
$(eval $(call TensorKernelPrebuilt,pantah))

# Google Pixel 7a
PKG_SOURCE_URL:=https://github.com/hentaiOS-Devices/device_google_lynx-kernel.git
PKG_SOURCE_VERSION:=29cfade3d8f2885a5c53e08a44d09650eef23c49
PKG_SOUCE_HASH:=skip
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-lynx.tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-lynx
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-lynx
$(eval $(call TensorKernelPrebuilt,lynx))

# Google Pixel 8 / 8 Pro
PKG_SOURCE_URL:=https://github.com/hentaiOS-Devices/device_google_shusky-kernel.git
PKG_SOURCE_VERSION:=29cfade3d8f2885a5c53e08a44d09650eef23c49
PKG_SOUCE_HASH:=skip
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-shusky.tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-shusky
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-shusky
$(eval $(call TensorKernelPrebuilt,shusky))
