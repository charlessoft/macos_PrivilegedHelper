#-------------------------------------------------
#
# Project created by QtCreator 2021-01-20T15:25:56
#
#-------------------------------------------------

QT       += core gui
include (../iSearchProject.pri)
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = iSearch
TEMPLATE = app



QMAKE_LFLAGS += -framework Carbon -framework Foundation -framework ApplicationServices
LIBS += -framework Cocoa -framework WebKit -framework Security  -framework AppKit -framework ImageCaptureCore -framework Quartz



INCLUDEPATH += \
               /System/Library/Frameworks/Foundation.framework/Headers

INCLUDEPATH += ./resourcesmangmt

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS






# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

CONFIG += c++17

PRECOMPILED_HEADER = pch.h

QMAKE_LFLAGS += -framework Carbon -framework Foundation -framework ApplicationServices

LIBS += -framework Cocoa -framework WebKit -framework Security  -framework AppKit -framework ImageCaptureCore -framework Quartz
QMAKE_CXXFLAGS += -libstd=libc++
QMAKE_CXXFLAGS += -fvisibility=hidden
QMAKE_CXXFLAGS += -fvisibility-inlines-hidden
QMAKE_CXXFLAGS += -std=c++17


LIBS += \
        -framework Security \
        -framework CoreFoundation \
        -framework SystemConfiguration \
        -framework IOKit \
        -framework ApplicationServices

LIBS += -framework Security -framework Cocoa -framework Foundation -framework ServiceManagement


INCLUDEPATH += /System/Library/Frameworks/ApplicationServices.framework/Headers \
               /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Headers \
               /System/Library/Frameworks/Foundation.framework/Headers \
               /System/Library/Frameworks/Security.framework/Headers \




# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

CONFIG += c++11

SOURCES += \
        main.cpp \
        dialog.cpp \
        smjobblessWrap.mm \
        smjobbless.mm

HEADERS += \
        dialog.h \
        smjobblessWrap.h \
        smjobbless.h

FORMS += \
        dialog.ui

DISTFILES += \
    Info.plist

QMAKE_INFO_PLIST = Info.plist

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
