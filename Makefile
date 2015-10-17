export ARCHS = armv7 arm64
export THEOS_DEVICE_IP = 192.168.0.100

include theos/makefiles/common.mk

TWEAK_NAME = NoP8geLimits
NoP8geLimits_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
