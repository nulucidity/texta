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
#   File: medusa.pro
#
# Author: $author$
#   Date: 6/17/2023
#
# os specific QtCreator project .pro file for framework medusa executable medusa
########################################################################
# Depends: nadir;rostra;coral
#
# Debug: medusa/build/os/QtCreator/Debug/bin/medusa
# Release: medusa/build/os/QtCreator/Release/bin/medusa
# Profile: medusa/build/os/QtCreator/Profile/bin/medusa
#
include(../../../../../build/QtCreator/medusa.pri)
include(../../../../QtCreator/medusa.pri)
include(../../medusa.pri)
include(../../../../QtCreator/app/medusa/medusa.pri)

TARGET = $${medusa_exe_TARGET}

########################################################################
# INCLUDEPATH
#
INCLUDEPATH += \
$${medusa_exe_INCLUDEPATH} \

# DEFINES
#
DEFINES += \
$${medusa_exe_DEFINES} \

########################################################################
# OBJECTIVE_HEADERS
#
OBJECTIVE_HEADERS += \
$${medusa_exe_OBJECTIVE_HEADERS} \

# OBJECTIVE_SOURCES
#
OBJECTIVE_SOURCES += \
$${medusa_exe_OBJECTIVE_SOURCES} \

########################################################################
# HEADERS
#
HEADERS += \
$${medusa_exe_HEADERS} \
$${medusa_exe_OBJECTIVE_HEADERS} \

# SOURCES
#
SOURCES += \
$${medusa_exe_SOURCES} \

########################################################################
# FRAMEWORKS
#
FRAMEWORKS += \
$${medusa_exe_FRAMEWORKS} \

# LIBS
#
LIBS += \
$${medusa_exe_LIBS} \
$${FRAMEWORKS} \

########################################################################
