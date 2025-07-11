#
# Copyright (C) 2025 JoshuaDoes
#

include $(TOPDIR)/rules.mk

PKG_NAME:=magiskboot
PKG_VERSION:=30.1
PKG_SOURCE_URL:=https://github.com/topjohnwu/Magisk/releases/download/v$(PKG_VERSION)
PKG_HASH:=248735479ba807c879aea69494896b5ba581a006735142b09d353961d66d7d2a
PKG_SOURCE_SUBDIR:=$(PKG_NAME)
PKG_SOURCE:=Magisk-v$(PKG_VERSION).apk

HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/$(PKG_NAME)
HOST_BUILD_ARCH:=$(shell uname -m)


include $(INCLUDE_DIR)/host-build.mk

define Host/Prepare
	mkdir -p $(HOST_BUILD_DIR)
	unzip -q $(DL_DIR)/$(PKG_SOURCE) 'lib/*/libmagiskboot.so' -d $(HOST_BUILD_DIR)
endef

define Host/Compile
	true
endef

define Host/Install
	case "$(HOST_BUILD_ARCH)" in \
		x86_64) cp $(HOST_BUILD_DIR)/lib/x86_64/libmagiskboot.so $(STAGING_DIR_HOST)/bin/magiskboot;; \
		i386|i486|i586|i686) cp $(HOST_BUILD_DIR)/lib/x86/libmagiskboot.so $(STAGING_DIR_HOST)/bin/magiskboot;; \
		aarch64|arm64) cp $(HOST_BUILD_DIR)/lib/arm64-v8a/libmagiskboot.so $(STAGING_DIR_HOST)/bin/magiskboot;; \
		armv7l|armv8l|arm) cp $(HOST_BUILD_DIR)/lib/armeabi-v7a/libmagiskboot.so $(STAGING_DIR_HOST)/bin/magiskboot;; \
		*) echo "Unsupported host arch: $(HOST_BUILD_ARCH)"; exit 1;; \
	esac
	chmod +x $(STAGING_DIR_HOST)/bin/magiskboot
endef

$(eval $(call HostBuild))
