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
#   File: openssl.pri
#
# Author: $author$
#   Date: 3/5/2023
#
# generic QtCreator project file for framework talas executable openssl
########################################################################

########################################################################
# openssl

# openssl_exe TARGET
#
openssl_exe_TARGET = openssl

# openssl_exe INCLUDEPATH
#
openssl_exe_INCLUDEPATH += \
$${talas_openssl_INCLUDEPATH} \

# openssl_exe DEFINES
#
openssl_exe_DEFINES += \
$${talas_openssl_DEFINES} \
DEFAULT_LOGGING_LEVELS_ERROR \
XOS_CONSOLE_MAIN_MAIN \

########################################################################
# openssl_exe OBJECTIVE_HEADERS
#
#openssl_exe_OBJECTIVE_HEADERS += \
#$${TALAS_SRC}/xos/app/console/openssl/main.hh \

# openssl_exe OBJECTIVE_SOURCES
#
#openssl_exe_OBJECTIVE_SOURCES += \
#$${TALAS_SRC}/xos/app/console/openssl/main.mm \

########################################################################
# openssl_exe HEADERS
#
openssl_exe_HEADERS += \
$${OPENSSL_SRC}/crypto/bio/bio.h \
\
$${TALAS_SRC}/talas/base/base.hpp \
$${TALAS_SRC}/talas/network/os/sockets.hpp \
$${TALAS_SRC}/talas/protocol/tls/openssl/bio_rw.hpp \
$${TALAS_SRC}/talas/protocol/tls/openssl/openssl.hpp \
\
$${TALAS_SRC}/talas/console/main_opt.hpp \
$${TALAS_SRC}/talas/console/main.hpp \
$${TALAS_SRC}/talas/console/main_main.hpp \
\
$${TALAS_SRC}/talas/app/console/openssl/main_opt.hpp \
$${TALAS_SRC}/talas/app/console/openssl/main.hpp \

# openssl_exe SOURCES
#
openssl_exe_SOURCES += \
$${OPENSSL_SRC}/crypto/bio/bio_lib.c \
\
$${TALAS_SRC}/talas/network/os/sockets.cpp \
$${TALAS_SRC}/talas/protocol/tls/openssl/bio_rw.cpp \
$${TALAS_SRC}/talas/protocol/tls/openssl/openssl.cpp \
\
$${TALAS_SRC}/talas/console/main_main.cpp \
\
$${TALAS_SRC}/talas/app/console/openssl/main_opt.cpp \
$${TALAS_SRC}/talas/app/console/openssl/main.cpp \

########################################################################
# openssl_exe FRAMEWORKS
#
openssl_exe_FRAMEWORKS += \
$${talas_openssl_FRAMEWORKS} \

# openssl_exe LIBS
#
openssl_exe_LIBS += \
$${talas_openssl_LIBS} \

########################################################################
# NO Qt
QT -= gui core
