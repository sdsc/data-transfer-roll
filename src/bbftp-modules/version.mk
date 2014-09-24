NAME        = bbftp-modules
RELEASE     = 1
PKGROOT     = /opt/modulefiles/applications/bbftp

VERSION_SRC = $(REDHAT.ROOT)/src/bbftpc/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

RPM.EXTRAS  = AutoReq:No
