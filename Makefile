ARCHS = armv7 arm64
DEBUG = 0
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = creamxi
creamxi_FILES = Tweak.xm
creamxi_LIBRARIES = colorpicker
include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += creamxi
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"
