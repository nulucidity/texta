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
#   File: libcoral.pri
#
# Author: $author$
#   Date: 3/4/2023
#
# generic QtCreator project file for framework coral static library libcoral
########################################################################

########################################################################
# libcoral
XOS_LIB_CORAL_VERSION_BUILD_DATE = 3/4/2023 #$$system(~/bin/utility/tdate)

# libcoral TARGET
#
libcoral_TARGET = coral
libcoral_TEMPLATE = lib
libcoral_CONFIG += staticlib

# libcoral INCLUDEPATH
#
libcoral_INCLUDEPATH += \
$${coral_INCLUDEPATH} \

# libcoral DEFINES
#
libcoral_DEFINES += \
$${coral_DEFINES} \
DEFAULT_LOGGING_LEVELS_ERROR \
XOS_LIB_CORAL_VERSION_BUILD_DATE=$${XOS_LIB_CORAL_VERSION_BUILD_DATE} \

########################################################################
# libcoral OBJECTIVE_HEADERS
#
#libcoral_OBJECTIVE_HEADERS += \
#$${CORAL_SRC}/xos/lib/coral/version.hh \

# libcoral OBJECTIVE_SOURCES
#
#libcoral_OBJECTIVE_SOURCES += \
#$${CORAL_SRC}/xos/lib/coral/version.mm \

########################################################################
# libcoral HEADERS
#
libcoral_HEADERS += \
$${CORAL_SRC}/coral/base/string.hpp \
$${CORAL_SRC}/coral/base/array.hpp \
$${CORAL_SRC}/coral/base/types.hpp \
$${CORAL_SRC}/coral/base/base.hpp \
\
$${CORAL_SRC}/coral/io/stream.hpp \
$${CORAL_SRC}/coral/io/writer.hpp \
$${CORAL_SRC}/coral/io/reader.hpp \
$${CORAL_SRC}/coral/io/sequence.hpp \
\
$${CORAL_SRC}/coral/nadir/lib/version.hpp \
$${CORAL_SRC}/coral/xos/lib/version.hpp \
$${CORAL_SRC}/coral/lib/version.hpp \
$${CORAL_SRC}/coral/lib/coral/version.hpp \

# libcoral SOURCES
#
libcoral_SOURCES += \
$${CORAL_SRC}/coral/base/string.cpp \
$${CORAL_SRC}/coral/base/array.cpp \
$${CORAL_SRC}/coral/base/types.cpp \
$${CORAL_SRC}/coral/base/base.cpp \
\
$${CORAL_SRC}/coral/io/stream.cpp \
$${CORAL_SRC}/coral/io/writer.cpp \
$${CORAL_SRC}/coral/io/reader.cpp \
$${CORAL_SRC}/coral/io/sequence.cpp \
\
$${CORAL_SRC}/coral/lib/coral/version.cpp \

########################################################################
