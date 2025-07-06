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
#   File: network.pri
#
# Author: $author$
#   Date: 3/5/2023
#
# generic QtCreator project file for framework talas executable network
########################################################################

########################################################################
# network

# network TARGET
#
network_TARGET = network

# network INCLUDEPATH
#
network_INCLUDEPATH += \
$${talas_INCLUDEPATH} \

# network DEFINES
#
network_DEFINES += \
$${talas_DEFINES} \
DEFAULT_LOGGING_LEVELS_ERROR \
XOS_CONSOLE_MAIN_MAIN \

########################################################################
# network OBJECTIVE_HEADERS
#
#network_OBJECTIVE_HEADERS += \
#$${TALAS_SRC}/xos/app/console/network/main.hh \

# network OBJECTIVE_SOURCES
#
#network_OBJECTIVE_SOURCES += \
#$${TALAS_SRC}/xos/app/console/network/main.mm \

########################################################################
# network HEADERS
#
network_HEADERS += \
$${TALAS_SRC}/talas/app/console/network/main_opt.hpp \
$${TALAS_SRC}/talas/app/console/network/main.hpp \

# network SOURCES
#
network_SOURCES += \
$${TALAS_SRC}/talas/app/console/network/main_opt.cpp \
$${TALAS_SRC}/talas/app/console/network/main.cpp \

########################################################################
# network FRAMEWORKS
#
network_FRAMEWORKS += \
$${talas_FRAMEWORKS} \

# network LIBS
#
network_LIBS += \
$${talas_LIBS} \

########################################################################
# NO Qt
QT -= gui core
