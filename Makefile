include $(THEOS)/makefiles/common.mk

ADDITIONAL_CFLAGS = -fobjc-arc
TWEAK_NAME = Exsto
Exsto_FILES = Tweak.xm EXSTOCircleMenuView.m
Exsto_FRAMEWORKS = CydiaSubstrate UIKit CoreGraphics Foundation QuartzCore
Exsto_LIBRARIES =
Exsto_LDFLAGS += -Wl,-segalign,4000

export ARCHS = arm64 arm64e
Exsto_ARCHS = arm64 arm64e

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += exsto
include $(THEOS_MAKE_PATH)/aggregate.mk
