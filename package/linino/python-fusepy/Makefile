#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fusepy
PKG_VERSION:=2.0.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/70/aa/959d781b7ac979af1a9fbea0faffe06677c390907b56b8ce024eb9320451
PKG_MD5SUM:=2b9ac15c1ee854e402ed2f63039d59dd

# PKG_BUILD_DEPENDS:=+python-expat +python-openssl +libopenssl

# TARGET_LDFLAGS += -L${STAGING_DIR}/lib \
		-L${STAGING_DIR}/usr/lib/python2.7

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-fusepy
  SECTION:=language-python
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=python-fusepy
  URL:=http://sourceforge.net/projects/flask
  DEPENDS:=+python
endef

define Package/python-fusepy/description
Python module interface to the cURL library.
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix=/usr --root=$(PKG_INSTALL_DIR))
endef

define Package/python-fusepy/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,python-fusepy))
