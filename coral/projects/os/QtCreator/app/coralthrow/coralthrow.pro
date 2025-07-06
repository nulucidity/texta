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
#   File: coralthrow.pro
#
# Author: $author$
#   Date: 3/4/2023
#
# os specific QtCreator project .pro file for framework coral executable coralthrow
########################################################################
# Depends: nadir;rostra;medusa
#
# Debug: coral/build/os/QtCreator/Debug/bin/coralthrow
# Release: coral/build/os/QtCreator/Release/bin/coralthrow
# Profile: coral/build/os/QtCreator/Profile/bin/coralthrow
#
include(../../../../../build/QtCreator/coral.pri)
include(../../../../QtCreator/coral.pri)
include(../../coral.pri)
include(../../../../QtCreator/app/coralthrow/coralthrow.pri)

TARGET = $${coralthrow_TARGET}

########################################################################
# INCLUDEPATH
#
INCLUDEPATH += \
$${coralthrow_INCLUDEPATH} \

# DEFINES
# 
DEFINES += \
$${coralthrow_DEFINES} \

########################################################################
# OBJECTIVE_HEADERS
#
OBJECTIVE_HEADERS += \
$${coralthrow_OBJECTIVE_HEADERS} \

# OBJECTIVE_SOURCES
#
OBJECTIVE_SOURCES += \
$${coralthrow_OBJECTIVE_SOURCES} \

########################################################################
# HEADERS
#
HEADERS += \
$${coralthrow_HEADERS} \
$${coralthrow_OBJECTIVE_HEADERS} \

# SOURCES
#
SOURCES += \
$${coralthrow_SOURCES} \

########################################################################
# FRAMEWORKS
#
FRAMEWORKS += \
$${coralthrow_FRAMEWORKS} \

# LIBS
#
LIBS += \
$${coralthrow_LIBS} \
$${FRAMEWORKS} \

########################################################################
