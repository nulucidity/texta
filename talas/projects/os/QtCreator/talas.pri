########################################################################
# Copyright (c) 1988-2023 $organization$
#
# This software is provided by the author and contributors ``as is''
# and any express or implied warranties, including, but not limited to,
# the implied warranties of merchantability and fitness for a particular
# purpose are disclaimed. In no event shall the author or contributors
# be liable for any direct, indirect, incidental, special, exemplary,
# or consequential damages (including, but not limited to, procurement
# of substitute goods or services; loss of use, data, or profits; or
# business interruption) however caused and on any theory of liability,
# whether in contract, strict liability, or tort (including negligence
# or otherwise) arising in any way out of the use of this software,
# even if advised of the possibility of such damage.
#
#   File: talas.pri
#
# Author: $author$
#   Date: 3/5/2023, 6/17/2023
#
# os specific QtCreator project file for framework talas
########################################################################
# Depends: openssl;libressl;bn;mp;nadir;rostra

UNAME = $$system(uname)

contains(UNAME,Darwin) {
DARWIN_VERSION = $$system(sw_vers -productVersion)
} else {
contains(UNAME,Linux) {
LINUX_VERSION = $$system(uname -r)
} else {
contains(UNAME,Windows) {
WINDOWS_VERSION = $$system(ver)
} else {
} # contains(UNAME,Windows)
} # contains(UNAME,Linux)
} # contains(UNAME,Darwin)

contains(UNAME,Darwin) {
DARWIN_VERSION_NUMBER = $$system(echo $${DARWIN_VERSION} | cut -d'.' -f1)
contains(DARWIN_VERSION_NUMBER,15) {
DARWIN_VERSION_NAME = Sequoia
} else {
contains(DARWIN_VERSION_NUMBER,14) {
DARWIN_VERSION_NAME = Sonoma
} else {
contains(DARWIN_VERSION_NUMBER,13) {
DARWIN_VERSION_NAME = Ventura
} else {
contains(DARWIN_VERSION_NUMBER,12) {
DARWIN_VERSION_NAME = Monterey
} else {
contains(DARWIN_VERSION_NUMBER,11) {
DARWIN_VERSION_NAME = Bigsur
} else {
contains(DARWIN_VERSION_NUMBER,10) {
DARWIN_VERSION_NAME = Sierra
} else {
DARWIN_VERSION_NAME = Mavricks
} # contains(DARWIN_VERSION,10)
} # contains(DARWIN_VERSION,11)
} # contains(DARWIN_VERSION,12)
} # contains(DARWIN_VERSION,13)
} # contains(DARWIN_VERSION,14)
} # contains(DARWIN_VERSION,15)
} # contains(UNAME,Darwin)

contains(UNAME,Darwin) {
TALAS_OS = macosx
} else {
contains(UNAME,Linux) {
TALAS_OS = linux
} else {
TALAS_OS = windows
} # contains(UNAME,Linux)
} # contains(UNAME,Darwin)

contains(BUILD_OS,TALAS_OS) {
TALAS_BUILD = $${TALAS_OS}
} else {
TALAS_BUILD = $${BUILD_OS}
} # contains(BUILD_OS,TALAS_OS)

contains(BUILD_CPP_VERSION,10) {
CONFIG += c++0x
} else {
contains(BUILD_CPP_VERSION,98|03|11|14|17) {
CONFIG += c++$${BUILD_CPP_VERSION}
} else {
} # contains(BUILD_CPP_VERSION,98|03|11|14|17)
} # contains(BUILD_CPP_VERSION,10)

contains(TALAS_OS,macosx) {
contains(DARWIN_VERSION_NUMBER,15) {
#QMAKE_CXXFLAGS += -Werror -Wno-error=register
QMAKE_CXXFLAGS += -Wno-register
} else {
} # contains(DARWIN_VERSION_NUMBER,15)
contains(DARWIN_VERSION_NUMBER,14) {
QMAKE_CXXFLAGS += -Wno-dynamic-exception-spec
} else {
} # contains(DARWIN_VERSION_NUMBER,14)
contains(DARWIN_VERSION_NUMBER,11|12|13|14|15) {
QMAKE_CFLAGS += -Wno-implicit-function-declaration
} else {
} # contains(DARWIN_VERSION_NUMBER,11|12|13|14|15)
} else {
contains(TALAS_OS,linux) {
QMAKE_CXXFLAGS += -fpermissive
} else {
contains(TALAS_OS,windows) {
} else {
} # contains(TALAS_OS,windows)
} # contains(TALAS_OS,linux)
} # contains(TALAS_OS,macosx)

########################################################################
# openssl
OPENSSL_THIRDPARTY_PKG_MAKE_BLD = $${OPENSSL_THIRDPARTY_PKG}/build/$${TALAS_BUILD}/$${BUILD_CONFIG}
OPENSSL_THIRDPARTY_PRJ_MAKE_BLD = $${OTHER_BLD}/$${OPENSSL_THIRDPARTY_PRJ}/build/$${TALAS_BUILD}/$${BUILD_CONFIG}
OPENSSL_THIRDPARTY_PKG_BLD = $${OPENSSL_THIRDPARTY_PKG}/build/$${TALAS_BUILD}/QtCreator/$${BUILD_CONFIG}
OPENSSL_THIRDPARTY_PRJ_BLD = $${OTHER_BLD}/$${OPENSSL_THIRDPARTY_PRJ}/build/$${TALAS_BUILD}/QtCreator/$${BUILD_CONFIG}
OPENSSL_PKG_BLD = $${OTHER_BLD}/$${OPENSSL_PKG}/build/$${TALAS_BUILD}/QtCreator/$${BUILD_CONFIG}
OPENSSL_PRJ_BLD = $${OTHER_BLD}/$${OPENSSL_PRJ}/build/$${TALAS_BUILD}/QtCreator/$${BUILD_CONFIG}
#OPENSSL_LIB = $${OPENSSL_THIRDPARTY_PKG_MAKE_BLD}/lib
#OPENSSL_LIB = $${OPENSSL_THIRDPARTY_PRJ_MAKE_BLD}/lib
#OPENSSL_LIB = $${OPENSSL_THIRDPARTY_PKG_BLD}/lib
#OPENSSL_LIB = $${OPENSSL_THIRDPARTY_PRJ_BLD}/lib
#OPENSSL_LIB = $${OPENSSL_PKG_BLD}/lib
#OPENSSL_LIB = $${OPENSSL_PRJ_BLD}/lib
#OPENSSL_LIB = $${TALAS_LIB}
#OPENSSL_LIB_NAME = $${OPENSSL_NAME}
OPENSSL_LIB = $${OTHER_BLD}/$${THIRDPARTY_PKG}/build/$${OPENSSL_BLD_DIR}/lib

contains(OPENSSL_LIB_DIR, OPENSSL_HOME_BUILD_LIB) {
OPENSSL_LIB_DIR = $${OPENSSL_HOME_BUILD_LIB}
} else {
contains(OPENSSL_LIB_DIR, OPENSSL_HOME_SOURCE_BUILD_LIB) {
OPENSSL_LIB_DIR = $${OPENSSL_HOME_SOURCE_BUILD_LIB}
} else {
OPENSSL_LIB_DIR = $${OPENSSL_LIB}
} # contains(OPENSSL_LIB_DIR, OPENSSL_HOME_SOURCE_BUILD_LIB)
} # contains(OPENSSL_LIB_DIR, OPENSSL_HOME_BUILD_LIB)

# openssl LIBS
#
openssl_LIBS += \
-L$${OPENSSL_LIB_DIR} \
-lssl \
-lcrypto \


########################################################################
# libressl
LIBRESSL_THIRDPARTY_PKG_MAKE_BLD = $${LIBRESSL_THIRDPARTY_PKG}/build/$${TALAS_BUILD}/$${BUILD_CONFIG}
LIBRESSL_THIRDPARTY_PRJ_MAKE_BLD = $${OTHER_BLD}/$${LIBRESSL_THIRDPARTY_PRJ}/build/$${TALAS_BUILD}/$${BUILD_CONFIG}
LIBRESSL_THIRDPARTY_PKG_BLD = $${LIBRESSL_THIRDPARTY_PKG}/build/$${TALAS_BUILD}/QtCreator/$${BUILD_CONFIG}
LIBRESSL_THIRDPARTY_PRJ_BLD = $${OTHER_BLD}/$${LIBRESSL_THIRDPARTY_PRJ}/build/$${TALAS_BUILD}/QtCreator/$${BUILD_CONFIG}
LIBRESSL_PKG_BLD = $${OTHER_BLD}/$${LIBRESSL_PKG}/build/$${TALAS_BUILD}/QtCreator/$${BUILD_CONFIG}
LIBRESSL_PRJ_BLD = $${OTHER_BLD}/$${LIBRESSL_PRJ}/build/$${TALAS_BUILD}/QtCreator/$${BUILD_CONFIG}
#LIBRESSL_LIB = $${LIBRESSL_THIRDPARTY_PKG_MAKE_BLD}/lib
#LIBRESSL_LIB = $${LIBRESSL_THIRDPARTY_PRJ_MAKE_BLD}/lib
#LIBRESSL_LIB = $${LIBRESSL_THIRDPARTY_PKG_BLD}/lib
#LIBRESSL_LIB = $${LIBRESSL_THIRDPARTY_PRJ_BLD}/lib
#LIBRESSL_LIB = $${LIBRESSL_PKG_BLD}/lib
#LIBRESSL_LIB = $${LIBRESSL_PRJ_BLD}/lib
#LIBRESSL_LIB = $${TALAS_LIB}
#LIBRESSL_LIB_NAME = $${LIBRESSL_NAME}
LIBRESSL_LIB = $${OTHER_BLD}/$${THIRDPARTY_PKG}/build/$${LIBRESSL_BLD_DIR}/lib

contains(LIBRESSL_LIB_DIR, LIBRESSL_HOME_BUILD_LIB) {
LIBRESSL_LIB_DIR = $${LIBRESSL_HOME_BUILD_LIB}
} else {
contains(LIBRESSL_LIB_DIR, LIBRESSL_HOME_SOURCE_BUILD_LIB) {
LIBRESSL_LIB_DIR = $${LIBRESSL_HOME_SOURCE_BUILD_LIB}
} else {
LIBRESSL_LIB_DIR = $${LIBRESSL_LIB}
} # contains(LIBRESSL_LIB_DIR, LIBRESSL_HOME_SOURCE_BUILD_LIB)
} # contains(LIBRESSL_LIB_DIR, LIBRESSL_HOME_BUILD_LIB)

# libressl LIBS
#
libressl_LIBS += \
-L$${LIBRESSL_LIB_DIR} \
-ltls \
-lssl \
-lcrypto \


########################################################################
# bn
BN_THIRDPARTY_PKG_MAKE_BLD = $${BN_THIRDPARTY_PKG}/build/$${TALAS_BUILD}/$${BUILD_CONFIG}
BN_THIRDPARTY_PRJ_MAKE_BLD = $${OTHER_BLD}/$${BN_THIRDPARTY_PRJ}/build/$${TALAS_BUILD}/$${BUILD_CONFIG}
BN_THIRDPARTY_PKG_BLD = $${BN_THIRDPARTY_PKG}/build/$${TALAS_BUILD}/QtCreator/$${BUILD_CONFIG}
BN_THIRDPARTY_PRJ_BLD = $${OTHER_BLD}/$${BN_THIRDPARTY_PRJ}/build/$${TALAS_BUILD}/QtCreator/$${BUILD_CONFIG}
BN_PKG_BLD = $${OTHER_BLD}/$${BN_PKG}/build/$${TALAS_BUILD}/QtCreator/$${BUILD_CONFIG}
BN_PRJ_BLD = $${OTHER_BLD}/$${BN_PRJ}/build/$${TALAS_BUILD}/QtCreator/$${BUILD_CONFIG}
#BN_LIB = $${BN_THIRDPARTY_PKG_MAKE_BLD}/lib
#BN_LIB = $${BN_THIRDPARTY_PRJ_MAKE_BLD}/lib
#BN_LIB = $${BN_THIRDPARTY_PKG_BLD}/lib
#BN_LIB = $${BN_THIRDPARTY_PRJ_BLD}/lib
#BN_LIB = $${BN_PKG_BLD}/lib
#BN_LIB = $${BN_PRJ_BLD}/lib
BN_LIB = $${TALAS_LIB}
BN_LIB_NAME = $${BN_NAME}

# bn LIBS
#
bn_LIBS += \
-L$${BN_LIB}/lib$${BN_LIB_NAME} \
-l$${BN_LIB_NAME} \


########################################################################
# mp
MP_THIRDPARTY_PKG_MAKE_BLD = $${MP_THIRDPARTY_PKG}/build/$${TALAS_BUILD}/$${BUILD_CONFIG}
MP_THIRDPARTY_PRJ_MAKE_BLD = $${OTHER_BLD}/$${MP_THIRDPARTY_PRJ}/build/$${TALAS_BUILD}/$${BUILD_CONFIG}
MP_THIRDPARTY_PKG_BLD = $${MP_THIRDPARTY_PKG}/build/$${TALAS_BUILD}/QtCreator/$${BUILD_CONFIG}
MP_THIRDPARTY_PRJ_BLD = $${OTHER_BLD}/$${MP_THIRDPARTY_PRJ}/build/$${TALAS_BUILD}/QtCreator/$${BUILD_CONFIG}
MP_PKG_BLD = $${OTHER_BLD}/$${MP_PKG}/build/$${TALAS_BUILD}/QtCreator/$${BUILD_CONFIG}
MP_PRJ_BLD = $${OTHER_BLD}/$${MP_PRJ}/build/$${TALAS_BUILD}/QtCreator/$${BUILD_CONFIG}
#MP_LIB = $${MP_THIRDPARTY_PKG_MAKE_BLD}/lib
#MP_LIB = $${MP_THIRDPARTY_PRJ_MAKE_BLD}/lib
#MP_LIB = $${MP_THIRDPARTY_PKG_BLD}/lib
#MP_LIB = $${MP_THIRDPARTY_PRJ_BLD}/lib
#MP_LIB = $${MP_PKG_BLD}/lib
#MP_LIB = $${MP_PRJ_BLD}/lib
MP_LIB = $${TALAS_LIB}
MP_LIB_NAME = $${MP_NAME}

# mp LIBS
#
mp_LIBS += \
-L$${MP_LIB}/lib$${MP_LIB_NAME}z \
-l$${MP_LIB_NAME}z \
-L$${MP_LIB}/lib$${MP_LIB_NAME}n \
-l$${MP_LIB_NAME}n \
-L$${MP_LIB}/lib$${MP_LIB_NAME} \
-l$${MP_LIB_NAME} \


########################################################################
# nadir
NADIR_THIRDPARTY_PKG_MAKE_BLD = $${NADIR_THIRDPARTY_PKG}/build/$${TALAS_BUILD}/$${BUILD_CONFIG}
NADIR_THIRDPARTY_PRJ_MAKE_BLD = $${OTHER_BLD}/$${NADIR_THIRDPARTY_PRJ}/build/$${TALAS_BUILD}/$${BUILD_CONFIG}
NADIR_THIRDPARTY_PKG_BLD = $${NADIR_THIRDPARTY_PKG}/build/$${TALAS_BUILD}/QtCreator/$${BUILD_CONFIG}
NADIR_THIRDPARTY_PRJ_BLD = $${OTHER_BLD}/$${NADIR_THIRDPARTY_PRJ}/build/$${TALAS_BUILD}/QtCreator/$${BUILD_CONFIG}
NADIR_PKG_BLD = $${OTHER_BLD}/$${NADIR_PKG}/build/$${TALAS_BUILD}/QtCreator/$${BUILD_CONFIG}
NADIR_PRJ_BLD = $${OTHER_BLD}/$${NADIR_PRJ}/build/$${TALAS_BUILD}/QtCreator/$${BUILD_CONFIG}
#NADIR_LIB = $${NADIR_THIRDPARTY_PKG_MAKE_BLD}/lib
#NADIR_LIB = $${NADIR_THIRDPARTY_PRJ_MAKE_BLD}/lib
#NADIR_LIB = $${NADIR_THIRDPARTY_PKG_BLD}/lib
#NADIR_LIB = $${NADIR_THIRDPARTY_PRJ_BLD}/lib
NADIR_LIB = $${NADIR_PKG_BLD}/lib
#NADIR_LIB = $${NADIR_PRJ_BLD}/lib
#NADIR_LIB = $${TALAS_LIB}
NADIR_LIB_NAME = $${NADIR_NAME}

# nadir LIBS
#
nadir_LIBS += \
-L$${NADIR_LIB}/lib$${NADIR_LIB_NAME} \
-l$${NADIR_LIB_NAME} \


########################################################################
# rostra
ROSTRA_THIRDPARTY_PKG_MAKE_BLD = $${ROSTRA_THIRDPARTY_PKG}/build/$${TALAS_BUILD}/$${BUILD_CONFIG}
ROSTRA_THIRDPARTY_PRJ_MAKE_BLD = $${OTHER_BLD}/$${ROSTRA_THIRDPARTY_PRJ}/build/$${TALAS_BUILD}/$${BUILD_CONFIG}
ROSTRA_THIRDPARTY_PKG_BLD = $${ROSTRA_THIRDPARTY_PKG}/build/$${TALAS_BUILD}/QtCreator/$${BUILD_CONFIG}
ROSTRA_THIRDPARTY_PRJ_BLD = $${OTHER_BLD}/$${ROSTRA_THIRDPARTY_PRJ}/build/$${TALAS_BUILD}/QtCreator/$${BUILD_CONFIG}
ROSTRA_PKG_BLD = $${OTHER_BLD}/$${ROSTRA_PKG}/build/$${TALAS_BUILD}/QtCreator/$${BUILD_CONFIG}
ROSTRA_PRJ_BLD = $${OTHER_BLD}/$${ROSTRA_PRJ}/build/$${TALAS_BUILD}/QtCreator/$${BUILD_CONFIG}
#ROSTRA_LIB = $${ROSTRA_THIRDPARTY_PKG_MAKE_BLD}/lib
#ROSTRA_LIB = $${ROSTRA_THIRDPARTY_PRJ_MAKE_BLD}/lib
#ROSTRA_LIB = $${ROSTRA_THIRDPARTY_PKG_BLD}/lib
#ROSTRA_LIB = $${ROSTRA_THIRDPARTY_PRJ_BLD}/lib
ROSTRA_LIB = $${ROSTRA_PKG_BLD}/lib
#ROSTRA_LIB = $${ROSTRA_PRJ_BLD}/lib
#ROSTRA_LIB = $${TALAS_LIB}
ROSTRA_LIB_NAME = $${ROSTRA_NAME}

# rostra LIBS
#
rostra_LIBS += \
-L$${ROSTRA_LIB}/lib$${ROSTRA_LIB_NAME} \
-l$${ROSTRA_LIB_NAME} \

########################################################################
# talas

# talas INCLUDEPATH
#
talas_INCLUDEPATH += \

# talas DEFINES
#
talas_DEFINES += \

# talas os LIBS
#
contains(TALAS_OS,macosx|linux) {
talas_os_LIBS += \
-lpthread \
-ldl
} else {
} # contains(TALAS_OS,macosx|linux)

contains(TALAS_OS,linux) {
talas_os_LIBS += \
-lrt
} else {
} # contains(TALAS_OS,linux)


# talas base LIBS
#
talas_base_LIBS += \
$${rostra_LIBS} \
$${nadir_LIBS} \


# talas LIBS
#
talas_LIBS += \
$${talas_base_LIBS} \
$${build_talas_LIBS} \
$${talas_os_LIBS} \

# talas rsa LIBS
#
talas_rsa_LIBS += \
$${talas_base_LIBS} \
$${mp_LIBS} \
$${bn_LIBS} \
$${build_talas_LIBS} \
$${talas_os_LIBS} \

# talas libressl LIBS
#
talas_libressl_LIBS += \
$${talas_base_LIBS} \
$${libressl_LIBS} \
$${build_talas_LIBS} \
$${talas_os_LIBS} \

# talas openssl LIBS
#
talas_openssl_LIBS += \
$${talas_base_LIBS} \
$${openssl_LIBS} \
$${build_talas_LIBS} \
$${talas_os_LIBS} \

########################################################################
