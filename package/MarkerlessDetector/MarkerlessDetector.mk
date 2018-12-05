#
# PHUTBALL
# basic building rules
#
MARKERLESS_DETECTOR_VERSION = 1.1
MARKERLESS_DETECTOR_SOURCE = MarkerlessDetector.tar.gz
MARKERLESS_DETECTOR_SITE = NONE

MARKERLESS_DETECTOR_INSTALL_STAGING = YES

define MARKERLESS_DETECTOR_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef

define MARKERLESS_DETECTOR_INSTALL_STAGING_CMDS
	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) install
endef

define MARKERLESS_DETECTOR_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 package/MarkerlessDetector/S60MarkerlessDetector \
						  $(TARGET_DIR)/etc/init.d
endef

$(eval $(phutball-package))
