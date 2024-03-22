TARGET := iphone:latest:14.0
ARCHS := arm64

include $(THEOS)/makefiles/common.mk

ifeq ($(THEOS_PACKAGE_SCHEME),rootless)
		PACKAGE_BUILDNAME := rootless
else
		PACKAGE_BUILDNAME := rootful
endif

include $(THEOS_MAKE_PATH)/tool.mk

ifeq ($(THEOS_PACKAGE_SCHEME),rootless)
before-package::
	$(ECHO_BEGIN)cp $(THEOS_LAYOUT_DIR)/DEBIAN/control-rootless $(THEOS_STAGING_DIR)/DEBIAN/control$(ECHO_END)
endif
