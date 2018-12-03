# ################################################################################
# #
# # markerless-detector
# #
# ################################################################################

# MARKERLESS_DETECTOR_SOURCE = master.tgz
# MARKERLESS_DETECTOR_SITE = https://github.com/Chadys/MarkerlessDetector/archive/master.zip
# MARKERLESS_DETECTOR_SETUP_TYPE = setuptools
# MARKERLESS_DETECTOR_LICENSE = GNU

# define MARKERLESS_DETECTOR_SETUP
# 	( \
# 		mkdir -p $(TARGET_DIR)/etc/markerless-detector; \
# 		wget $(MARKERLESS_DETECTOR_SITE);
# 		unzip ./master.zip
# 		cp -r MarkerlessDetector-master \
# 			$(TARGET_DIR)/etc/markerless-detector; \
# 	)
# endef

# ifeq ($(BR2_PACKAGE_MARKERLESS_DETECTOR), y)
# define MARKERLESS_DETECTOR_SETUP_DETECTOR
# 	$(MARKERLESS_DETECTOR_SETUP_SIMPLE_MOTION_DETECTOR)
# endef
# endif

# define MARKERLESS_DETECTOR_INSTALL_LOGGING_CFG
# 	( \
# 		mkdir -p $(TARGET_DIR)/etc/markerless-detector; \
# 		mkdir -p $(TARGET_DIR)/root/markerless-detector-logs; \
# 		cp $(@D)/example-configs/logging.ini \
# 			$(TARGET_DIR)/etc/markerless-detector; \
# 		sed -i s/args=\(\'logs.*/args=\(\'\\/root\\/markerless-detector-logs\\/log\',\'w\',100000,100\)/ \
# 			$(TARGET_DIR)/etc/markerless-detector/logging.ini; \
# 	)
# endef

# define MARKERLESS_DETECTOR_INSTALL_EXTRA
# 	$(MARKERLESS_DETECTOR_INSTALL_LOGGING_CFG)
# 	$(MARKERLESS_DETECTOR_SETUP)
# endef

# MARKERLESS_DETECTOR_POST_INSTALL_TARGET_HOOKS += MARKERLESS_DETECTOR_INSTALL_EXTRA

# define MARKERLESS_DETECTOR_INSTALL_INIT_SYSV
# 	$(INSTALL) -D -m 0755 $(@D)/markerless-detector \
# 		$(TARGET_DIR)/etc/init.d
# endef

# $(eval $(python-package))
#
# PHUTBALL
# basic building rules
#

MARKERLESS_DETECTOR_VERSION = 1.1
MARKERLESS_DETECTOR_SOURCE = master.tgz
MARKERLESS_DETECTOR_SITE = NONE

MARKERLESS_DETECTOR_INSTALL_STAGING = YES

define MARKERLESS_DETECTOR_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef

define MARKERLESS_DETECTOR_INSTALL_STAGING_CMDS
	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) install
endef

define MARKERLESS_DETECTOR_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/markerless-detector \
						  $(TARGET_DIR)/etc/init.d
endef

$(eval $(markerless-detector-package))