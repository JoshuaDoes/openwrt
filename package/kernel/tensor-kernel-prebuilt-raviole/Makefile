#
# Copyright (C) 2025 JoshuaDoes
#

TENSOR_TARGET:=raviole
TENSOR_KERNEL_COMMIT:=ff96f402ce6f3be87cb40a16f33ac62d69cdb16a
TENSOR_KERNEL_SHA256:=b0b0b7acce6f062e1f6d919fa56afe3eb84be04671a09dcc2fc7fbeccb0fca97

include $(TOPDIR)/rules.mk
PKG_NAME:=tensor-kernel-prebuilt-raviole
PKG_RELEASE:=6.1.128
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/hentaiOS-Devices/device_google_raviole-kernel.git
PKG_SOURCE_VERSION:=ff96f402ce6f3be87cb40a16f33ac62d69cdb16a
PKG_SOURCE_HASH:=b0b0b7acce6f062e1f6d919fa56afe3eb84be04671a09dcc2fc7fbeccb0fca97
PKG_SOURCE:=tensor-kernel-prebuilt-raviole.tar.gz
PKG_SOURCE_SUBDIR:=tensor-kernel-prebuilt-raviole
PKG_BUILD_DIR:=$(BUILD_DIR)/tensor-kernel-prebuilt-raviole
PKG_BUILD_PARALLEL:=0
PKG_FLAGS:=nonshared

define Package/tensor-kernel-prebuilt-raviole
	SECTION:=kernel
	CATEGORY:=Kernel modules
	TITLE:=Tensor kernel prebuilts for raviole
	MAINTAINER:=JoshuaDoes using hentaiOS
	VERSION:=6.1.128
	URL:=https://github.com/hentaiOS-Devices/device_google_raviole-kernel
endef

define Package/tensor-kernel-prebuilt-raviole/description
	Prebuilt kernels, device trees and modules for Google Tensor on raviole
endef

define Build/Compile
	true
endef

define Package/tensor-kernel-prebuilt-raviole/install
	$(INSTALL_DIR) $(1)/lib/modules
	$(CP) $(PKG_BUILD_DIR)/*.ko $(1)/lib/modules/

	$(INSTALL_DIR) $(1)/etc
	$(CP) $(PKG_BUILD_DIR)/modules.load $(1)/etc/

	$(INSTALL_DIR) $(STAGING_DIR_IMAGE)
	$(CP) $(PKG_BUILD_DIR)/Image.lz4 $(STAGING_DIR_IMAGE)/$(TENSOR_TARGET)-Image.lz4
	$(CP) $(PKG_BUILD_DIR)/dtbo.img $(STAGING_DIR_IMAGE)/$(TENSOR_TARGET)-dtbo.img
endef

$(info [tensor] TENSOR_TARGET is $(TENSOR_TARGET))
$(info [tensor] TENSOR_KERNEL_COMMIT is $(TENSOR_KERNEL_COMMIT))
$(info [tensor] TENSOR_KERNEL_SHA256 is $(TENSOR_KERNEL_SHA256))
$(info [tensor] PKG_NAME is $(PKG_NAME))
$(info [tensor] PKG_MAINTAINER is $(PKG_MAINTAINER))
$(info [tensor] PKG_VERSION is $(PKG_VERSION))
$(info [tensor] PKG_RELEASE is $(PKG_RELEASE))
$(info [tensor] PKG_SECTION is $(PKG_SECTION))
$(info [tensor] PKG_CATEGORY is $(PKG_CATEGORY))
$(info [tensor] PKG_TITLE is $(PKG_TITLE))
$(info [tensor] PKG_SOURCE_PROTO is $(PKG_SOURCE_PROTO))
$(info [tensor] PKG_SOURCE_URL is $(PKG_SOURCE_URL))
$(info [tensor] PKG_SOURCE_VERSION is $(PKG_SOURCE_VERSION))
$(info [tensor] PKG_SOURCE_HASH is $(PKG_SOURCE_HASH))
$(info [tensor] PKG_SOURCE is $(PKG_SOURCE))
$(info [tensor] PKG_SOURCE_SUBDIR is $(PKG_SOURCE_SUBDIR))
$(info [tensor] PKG_BUILD_DIR is $(PKG_BUILD_DIR))
$(info [tensor] PKG_BUILD_PARALLEL is $(PKG_BUILD_PARALLEL))
$(info [tensor] PKG_FLAGS is $(PKG_FLAGS))

include $(INCLUDE_DIR)/package.mk
$(eval $(call BuildPackage,tensor-kernel-prebuilt-raviole))
