NAME           = bbftpc
VERSION        = 3.2.1
RELEASE        = 0
PKGROOT        = /opt/bbftp

SRC_SUBDIR     = bbftpc

SOURCE_NAME    = bbftp-client
SOURCE_VERSION = $(VERSION)
SOURCE_SUFFIX  = tar.gz
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
