ARCH = arm64
include $(SRC_PATH)build/platform-darwin.mk
CXX = clang++
CC = clang
ifneq ($(filter %86 x86_64, $(ARCH)),)
SDKTYPE = AppleTVSimulator
else
SDKTYPE = AppleTVOS
endif
SDK = $(shell xcrun --sdk $(shell echo $(SDKTYPE) | tr A-Z a-z) --show-sdk-version)
SDK_MIN = 9.0

XCODE=$(shell xcode-select -p)
SDKROOT = $(XCODE)/Platforms/$(SDKTYPE).platform/Developer/SDKs/$(SDKTYPE)$(SDK).sdk
CFLAGS += -arch $(ARCH) -isysroot $(SDKROOT) -mtvos-version-min=$(SDK_MIN) -fembed-bitcode -DAPPLE_IOS
LDFLAGS += -arch $(ARCH) -isysroot $(SDKROOT) -mtvos-version-min=$(SDK_MIN) -fembed-bitcode

