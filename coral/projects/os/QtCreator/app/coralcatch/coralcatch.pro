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
#   File: coralcatch.pro
#
# Author: $author$
#   Date: 3/4/2023
#
# os specific QtCreator project .pro file for framework coral executable coralcatch
########################################################################
# Depends: nadir;rostra;medusa
#
# Debug: coral/build/os/QtCreator/Debug/bin/coralcatch
# Release: coral/build/os/QtCreator/Release/bin/coralcatch
# Profile: coral/build/os/QtCreator/Profile/bin/coralcatch
#
include(../../../../../build/QtCreator/coral.pri)
include(../../../../QtCreator/coral.pri)
include(../../coral.pri)
include(../../../../QtCreator/app/coralcatch/coralcatch.pri)

TARGET = $${coralcatch_TARGET}

########################################################################
# INCLUDEPATH
#
INCLUDEPATH += \
$${coralcatch_INCLUDEPATH} \

# DEFINES
# 
DEFINES += \
$${coralcatch_DEFINES} \

########################################################################
# OBJECTIVE_HEADERS
#
OBJECTIVE_HEADERS += \
$${coralcatch_OBJECTIVE_HEADERS} \

# OBJECTIVE_SOURCES
#
OBJECTIVE_SOURCES += \
$${coralcatch_OBJECTIVE_SOURCES} \

########################################################################
# HEADERS
#
HEADERS += \
$${coralcatch_HEADERS} \
$${coralcatch_OBJECTIVE_HEADERS} \

# SOURCES
#
SOURCES += \
$${coralcatch_SOURCES} \

########################################################################
# FRAMEWORKS
#
FRAMEWORKS += \
$${coralcatch_FRAMEWORKS} \

# LIBS
#
LIBS += \
$${coralcatch_LIBS} \
$${FRAMEWORKS} \

########################################################################
