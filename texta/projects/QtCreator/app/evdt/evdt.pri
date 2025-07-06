########################################################################
# Copyright (c) 1988-2024 $organization$
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
#   File: evdt.pri
#
# Author: $author$
#   Date: 1/27/2024
#
# generic QtCreator project file for framework evup executable evdt
########################################################################

########################################################################
# evdt

# evdt TARGET
#
evdt_TARGET = evdt

# evdt INCLUDEPATH
#
evdt_INCLUDEPATH += \
$${evup_INCLUDEPATH} \

# evdt DEFINES
#
evdt_DEFINES += \
$${evup_DEFINES} \
DEFAULT_LOGGING_LEVELS_ERROR \
XOS_CONSOLE_MAIN_MAIN \

########################################################################
# evdt OBJECTIVE_HEADERS
#
#evdt_OBJECTIVE_HEADERS += \
#$${EVUP_SRC}/xos/app/console/evdt/main.hh \

# evdt OBJECTIVE_SOURCES
#
#evdt_OBJECTIVE_SOURCES += \
#$${EVUP_SRC}/xos/app/console/evdt/main.mm \

########################################################################
# evdt HEADERS
#
evdt_HEADERS += \
$${EVUP_SRC}/app/evdt/evdt.hpp \
$${EVUP_SRC}/os/evmain.hpp \

# evdt SOURCES
#
evdt_SOURCES += \
$${EVUP_SRC}/app/evdt/evdt.cpp \
$${EVUP_SRC}/os/evmain.cpp \

########################################################################
# evdt FRAMEWORKS
#
evdt_FRAMEWORKS += \
$${evup_FRAMEWORKS} \

# evdt LIBS
#
evdt_LIBS += \
$${evup_LIBS} \

########################################################################
# NO Qt
QT -= gui core
