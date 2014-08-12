NAME             = bbcp
VERSION          = 12.08.17
RELEASE          = 0
PKGROOT          = /opt/bbcp
RPM.EXTRAS         = AutoReq:No

SRC_SUBDIR       = bbcp

BBCP_NAME        = $(NAME)
BBCP_VERSION     = $(VERSION)
BBCP_PKG_SUFFIX  = tgz
BBCP_SOURCE_PKG  = $(BBCP_NAME)-$(BBCP_VERSION).$(BBCP_PKG_SUFFIX)
BBCP_SOURCE_DIR  = $(BBCP_SOURCE_PKG:%.$(BBCP_PKG_SUFFIX)=%)

TGZ_PKGS         = $(BBCP_SOURCE_PKG)
