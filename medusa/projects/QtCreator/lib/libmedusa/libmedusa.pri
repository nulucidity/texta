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
#   File: libmedusa.pri
#
# Author: $author$
#   Date: 3/4/2023
#
# generic QtCreator project file for framework medusa static library libmedusa
########################################################################

########################################################################
# libmedusa
XOS_LIB_MEDUSA_VERSION_BUILD_DATE = 3/4/2023 #$$system(~/bin/utility/tdate)

# libmedusa TARGET
#
libmedusa_TARGET = medusa
libmedusa_TEMPLATE = lib
libmedusa_CONFIG += staticlib

# libmedusa INCLUDEPATH
#
libmedusa_INCLUDEPATH += \
$${medusa_INCLUDEPATH} \

# libmedusa DEFINES
#
libmedusa_DEFINES += \
$${medusa_DEFINES} \
DEFAULT_LOGGING_LEVELS_ERROR \
XOS_LIB_MEDUSA_VERSION_BUILD_DATE=$${XOS_LIB_MEDUSA_VERSION_BUILD_DATE} \

########################################################################
# libmedusa OBJECTIVE_HEADERS
#
#libmedusa_OBJECTIVE_HEADERS += \
#$${MEDUSA_SRC}/xos/lib/medusa/version.hh \

# libmedusa OBJECTIVE_SOURCES
#
#libmedusa_OBJECTIVE_SOURCES += \
#$${MEDUSA_SRC}/xos/lib/medusa/version.mm \

########################################################################
# libmedusa HEADERS
#
libmedusa_HEADERS += \
$${MEDUSA_SRC}/medusa/inet/http/content/type/which.hpp \
$${MEDUSA_SRC}/medusa/inet/http/content/type/name.hpp \
\
$${MEDUSA_SRC}/medusa/inet/xttp/protocol/name.hpp \
$${MEDUSA_SRC}/medusa/inet/xttp/protocol/version.hpp \
$${MEDUSA_SRC}/medusa/inet/xttp/protocol/identifier.hpp \
\
$${MEDUSA_SRC}/medusa/lib/medusa/version.hpp \

# libmedusa SOURCES
#
libmedusa_SOURCES += \
$${MEDUSA_SRC}/medusa/inet/http/content/type/which.cpp \
$${MEDUSA_SRC}/medusa/inet/http/content/type/name.cpp \
\
$${MEDUSA_SRC}/medusa/inet/xttp/protocol/identifier.cpp \
\
$${MEDUSA_SRC}/medusa/lib/medusa/version.cpp \

########################################################################
