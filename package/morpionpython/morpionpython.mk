################################################################################
#
# morpionpython
#
################################################################################

MORPIONPYTHON_VERSION = a4abd5ac52be537d3c2a6dbb9a1c8038218c51f7
MORPIONPYTHON_SOURCE = morpion_python$(MORPIONPYTHON_VERSION).tar.gz
MORPIONPYTHON_SITE = $(call github,Chadys,morpion_python,$(MORPIONPYTHON_VERSION))

ifeq ($(BR2_PACKAGE_MORPIONPYTHON), y)
define MORPIONPYTHON
	read -p "Appuyer sur une touche pour continuer ..."

endef
endif

define MORPIONPYTHON_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/morpion.py $(TARGET_DIR)/bin/morpion.py
	read -p "Appuyer sur une touche pour continuer ..."
endef

$(eval $(generic-package))
