
##############################################################
#
# LDD3
#
##############################################################
LDD3_VERSION = v1.0.0
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD3_SITE = git@github.com:cu-ecen-aeld/assignment-7-bertac64
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES
LDD_MODULE_SUBDIRS = misc-modules scull
define LDD_BUILD_CMDS
	for dir in $(LDD_MODULE_SUBDIRS); do \
		$(MAKE) -C $$dir $(TARGET_CONFIGURE_OPTS); \
	done
endef

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(@D)/misc-modules/ $(TARGET_DIR)/etc/misc-modules/
	$(INSTALL) -m 0755 $(@D)/misc-modules/* $(TARGET_DIR)/etc/misc-modules/
	$(INSTALL) -d 0755 $(@D)/scull/ $(TARGET_DIR)/etc/scull/
	$(INSTALL) -m 0755 $(@D)/scull/* $(TARGET_DIR)/etc/scull/
	$(INSTALL) -m 0755 $(@D)/misc-modules/hello $(TARGET_DIR)/etc/init.d/S98lddmodules
endef

$(eval $(generic-package))
