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
#   File: evdt.pro
#
# Author: $author$
#   Date: 1/27/2024
#
# os specific QtCreator project .pro file for framework evup executable evdt
########################################################################
#
# Debug: evup/build/os/QtCreator/Debug/bin/evdt
# Release: evup/build/os/QtCreator/Release/bin/evdt
# Profile: evup/build/os/QtCreator/Profile/bin/evdt
#
include(../../../../../build/QtCreator/evup.pri)
include(../../../../QtCreator/evup.pri)
include(../../evup.pri)
include(../../../../QtCreator/app/evdt/evdt.pri)

TARGET = $${evdt_TARGET}

########################################################################
# INCLUDEPATH
#
INCLUDEPATH += \
$${evdt_INCLUDEPATH} \

# DEFINES
# 
DEFINES += \
$${evdt_DEFINES} \

########################################################################
# OBJECTIVE_HEADERS
#
OBJECTIVE_HEADERS += \
$${evdt_OBJECTIVE_HEADERS} \

# OBJECTIVE_SOURCES
#
OBJECTIVE_SOURCES += \
$${evdt_OBJECTIVE_SOURCES} \

########################################################################
# HEADERS
#
HEADERS += \
$${evdt_HEADERS} \
$${evdt_OBJECTIVE_HEADERS} \

# SOURCES
#
SOURCES += \
$${evdt_SOURCES} \

########################################################################
# FRAMEWORKS
#
FRAMEWORKS += \
$${evdt_FRAMEWORKS} \

# LIBS
#
LIBS += \
$${evdt_LIBS} \
$${FRAMEWORKS} \

########################################################################
