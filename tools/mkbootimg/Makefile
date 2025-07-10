#
# Copyright (C) 2025 JoshuaDoes
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mkbootimg
PKG_VERSION:=1.0
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/JoshuaDoes/mkbootimg
PKG_SOURCE_VERSION:=4227a83bde70d8652c94f8a5bc22750821202819
PKG_SOURCE_SUBDIR:=$(PKG_NAME)
PKG_SOURCE:=$(PKG_NAME).tar.gz

HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/$(PKG_NAME)

include $(INCLUDE_DIR)/host-build.mk

define Host/Compile
	$(MAKE) -C $(HOST_BUILD_DIR) CFLAGS="$(HOST_CFLAGS) -Wno-stringop-overflow -Wno-error"
endef

define Host/Install
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/mkbootimg $(STAGING_DIR_HOST)/bin/mkbootimg
endef

$(eval $(call HostBuild))
