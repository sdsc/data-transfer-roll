NAME        = bbcp-modules
RELEASE     = 1
PKGROOT     = /opt/modulefiles/applications/bbcp

VERSION_SRC = $(REDHAT.ROOT)/src/bbcp/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

RPM.EXTRAS  = AutoReq:No
