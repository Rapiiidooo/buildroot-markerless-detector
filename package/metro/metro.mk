#
# METRO
# basic building rules
#
METRO_VERSION = b2c91b66ce0ff2148f64b69841c1d7edc57db5ff
METRO_SOURCE = metro_project$(METRO_VERSION).tar.gz
METRO_SITE = $(call github,Chadys,metro_project,$(METRO_VERSION))
METRO_CONF_OPTS = -DBUILD_DEMOS=ON
METRO_INSTALL_TARGET = YES
METRO_INSTALL_STAGING = NO

define METRO_BUILD_CMDS
    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
	read -p "Appuyer sur une touche pour continuer ..."
endef

define METRO_INSTALL_STAGING_CMDS
    $(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) install
	read -p "Appuyer sur une touche pour continuer ..."
endef

define METRO_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/metro \
                          $(TARGET_DIR)/bin/metro
    $(INSTALL) -D -m 0755 $(@D)/tokyo.metro \
                          $(TARGET_DIR)/bin/tokyo.metro
	read -p "Appuyer sur une touche pour continuer ..."
endef

$(eval $(cmake-package))
