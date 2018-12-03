################################################################################
#
# markerless-detector
#
################################################################################

MARKERLESS_DETECTOR = 1.0
MARKERLESS_DETECTOR_SOURCE = markerless-detector-$(MARKERLESS_DETECTOR).tar.gz
MARKERLESS_DETECTOR_SITE = https://github.com/Chadys/MarkerlessDetector/archive/master.zip
MARKERLESS_DETECTOR_SETUP_TYPE = setuptools
MARKERLESS_DETECTOR_LICENSE = GNU
MARKERLESS_DETECTOR_DEPENDENCIES = python-imutils

define MARKERLESS_DETECTOR_SETUP
	( \
		mkdir -p $(TARGET_DIR)/etc/markerless-detector; \
		wget $(MARKERLESS_DETECTOR_SITE);
		unzip ./master.zip
		cp -r MarkerlessDetector-master \
			$(TARGET_DIR)/etc/markerless-detector; \
	)
endef

ifeq ($(BR2_PACKAGE_MARKERLESS_DETECTOR), y)
define MARKERLESS_DETECTOR_SETUP_DETECTOR
	$(MARKERLESS_DETECTOR_SETUP_SIMPLE_MOTION_DETECTOR)
endef
endif

define MARKERLESS_DETECTOR_INSTALL_LOGGING_CFG
	( \
		mkdir -p $(TARGET_DIR)/etc/markerless-detector; \
		mkdir -p $(TARGET_DIR)/root/markerless-detector-logs; \
		cp $(@D)/example-configs/logging.ini \
			$(TARGET_DIR)/etc/markerless-detector; \
		sed -i s/args=\(\'logs.*/args=\(\'\\/root\\/markerless-detector-logs\\/log\',\'w\',100000,100\)/ \
			$(TARGET_DIR)/etc/markerless-detector/logging.ini; \
	)
endef

define MARKERLESS_DETECTOR_INSTALL_EXTRA
	$(MARKERLESS_DETECTOR_INSTALL_LOGGING_CFG)
	$(MARKERLESS_DETECTOR_SETUP)
endef

MARKERLESS_DETECTOR_POST_INSTALL_TARGET_HOOKS += MARKERLESS_DETECTOR_INSTALL_EXTRA

define MARKERLESS_DETECTOR_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 755 package/markerless-detector/S60markerless-detector \
		$(TARGET_DIR)/etc/init.d
endef

$(eval $(python-package))
