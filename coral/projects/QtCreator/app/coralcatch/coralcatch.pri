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
#   File: coralcatch.pri
#
# Author: $author$
#   Date: 3/4/2023
#
# generic QtCreator project file for framework coral executable coralcatch
########################################################################

########################################################################
# coralcatch

# coralcatch TARGET
#
coralcatch_TARGET = coralcatch

# coralcatch INCLUDEPATH
#
coralcatch_INCLUDEPATH += \
$${coral_INCLUDEPATH} \

# coralcatch DEFINES
#
coralcatch_DEFINES += \
$${coral_DEFINES} \
DEFAULT_LOGGING_LEVELS_ERROR \
XOS_CONSOLE_MAIN_MAIN \

########################################################################
# coralcatch OBJECTIVE_HEADERS
#
#coralcatch_OBJECTIVE_HEADERS += \
#$${CORAL_SRC}/xos/app/console/coralcatch/main.hh \

# coralcatch OBJECTIVE_SOURCES
#
#coralcatch_OBJECTIVE_SOURCES += \
#$${CORAL_SRC}/xos/app/console/coralcatch/main.mm \

########################################################################
# coralcatch HEADERS
#
coralcatch_HEADERS += \
$${CORAL_SRC}/coral/app/cgi/catcher/main.hpp \

# coralcatch SOURCES
#
coralcatch_SOURCES += \
$${CORAL_SRC}/coral/app/cgi/catcher/main.cpp \

########################################################################
# coralcatch FRAMEWORKS
#
coralcatch_FRAMEWORKS += \
$${coral_FRAMEWORKS} \

# coralcatch LIBS
#
coralcatch_LIBS += \
$${coral_LIBS} \

########################################################################
# NO Qt
QT -= gui core
