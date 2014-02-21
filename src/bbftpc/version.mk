NAME               = bbftpc
VERSION            = 3.2.1
RELEASE            = 0
PKG_ROOT           = /opt/bbftp

SRC_SUBDIR         = bbftpc

BBFTPC_NAME        = bbftp-client
BBFTPC_VERSION     = $(VERSION)
BBFTPC_PKG_SUFFIX  = tar.gz
BBFTPC_SOURCE_PKG  = $(BBFTPC_NAME)-$(BBFTPC_VERSION).$(BBFTPC_PKG_SUFFIX)
BBFTPC_SOURCE_DIR  = $(BBFTPC_SOURCE_PKG:%.$(BBFTPC_PKG_SUFFIX)=%)

TAR_GZ_PKGS        = $(BBFTPC_SOURCE_PKG)
