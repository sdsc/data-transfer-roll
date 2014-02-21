NAME               = bbftpd
VERSION            = 3.2.1
RELEASE            = 0

PKG_ROOT           = /opt/bbftp

SRC_SUBDIR         = bbftpd

BBFTPD_NAME        = bbftp-server
BBFTPD_VERSION     = $(VERSION)
BBFTPD_PKG_SUFFIX  = tar.gz
BBFTPD_SOURCE_PKG  = $(BBFTPD_NAME)-$(BBFTPD_VERSION).$(BBFTPD_PKG_SUFFIX)
BBFTPD_SOURCE_DIR  = $(BBFTPD_SOURCE_PKG:%.$(BBFTPD_PKG_SUFFIX)=%)

TAR_GZ_PKGS        = $(BBFTPD_SOURCE_PKG)
