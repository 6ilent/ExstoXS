ARCHS = arm64 arm64e
TARGET = iphone:clang:11.2:11.2

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = Exsto

Exsto_FILES = EXORootListController.m
Exsto_INSTALL_PATH = /Library/PreferenceBundles
Exsto_FRAMEWORKS = UIKit
Exsto_PRIVATE_FRAMEWORKS = Preferences
Exsto_EXTRA_FRAMEWORKS += Cephei CepheiPrefs

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Exsto.plist$(ECHO_END)
