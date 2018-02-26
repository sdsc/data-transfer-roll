NAME           = sdsc-bbcp
VERSION        = 14.09.02.00.0
RELEASE        = 1
PKGROOT        = /opt/bbcp

SRC_SUBDIR     = bbcp

SOURCE_NAME    = bbcp
SOURCE_SUFFIX  = tgz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TGZ_PKGS       = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No\nAutoProv:No
RPM.PREFIX     = $(PKGROOT)
