NAME           = sdsc-bbcp
VERSION        = 17.12.00.00.0
RELEASE        = 0
PKGROOT        = /opt/bbcp

SRC_SUBDIR     = bbcp

SOURCE_NAME    = bbcp
SOURCE_SUFFIX  = tgz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_NAME)

TGZ_PKGS       = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No\nAutoProv:No
RPM.PREFIX     = $(PKGROOT)
