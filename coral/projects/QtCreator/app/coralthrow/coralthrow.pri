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
#   File: coralthrow.pri
#
# Author: $author$
#   Date: 3/4/2023
#
# generic QtCreator project file for framework coral executable coralthrow
########################################################################

########################################################################
# coralthrow

# coralthrow TARGET
#
coralthrow_TARGET = coralthrow

# coralthrow INCLUDEPATH
#
coralthrow_INCLUDEPATH += \
$${coral_INCLUDEPATH} \

# coralthrow DEFINES
#
coralthrow_DEFINES += \
$${coral_DEFINES} \
DEFAULT_LOGGING_LEVELS_ERROR \
XOS_CONSOLE_MAIN_MAIN \

########################################################################
# coralthrow OBJECTIVE_HEADERS
#
#coralthrow_OBJECTIVE_HEADERS += \
#$${CORAL_SRC}/xos/app/console/coralthrow/main.hh \

# coralthrow OBJECTIVE_SOURCES
#
#coralthrow_OBJECTIVE_SOURCES += \
#$${CORAL_SRC}/xos/app/console/coralthrow/main.mm \

########################################################################
# coralthrow HEADERS
#
coralthrow_HEADERS += \
$${CORAL_SRC}/coral/app/cgi/thrower/main.hpp \

# coralthrow SOURCES
#
coralthrow_SOURCES += \
$${CORAL_SRC}/coral/app/cgi/thrower/main.cpp \

########################################################################
# coralthrow FRAMEWORKS
#
coralthrow_FRAMEWORKS += \
$${coral_FRAMEWORKS} \

# coralthrow LIBS
#
coralthrow_LIBS += \
$${coral_LIBS} \

########################################################################
# NO Qt
QT -= gui core
