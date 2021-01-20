#-------------------------------------------------
#
# Project created by QtCreator 2020-12-22T13:36:13
#
#-------------------------------------------------

include (../iSearchProject.pri)
QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets


QMAKE_LFLAGS += -F /System/Library/Frameworks/Security.framework/ -sectcreate __TEXT __info_plist $$PWD/Info.plist -sectcreate __TEXT __launchd_plist $$PWD/Launchd.plist
LIBS += -framework Security -framework Cocoa


TARGET = com.cool.iSearch.Helper
CONFIG += console
CONFIG -= app_bundle

SOURCES += \
    main.cpp


DISTFILES += \
    Info.plist \
    Launchd.plist




#FORMS += \
#        mainwindow.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

# DISTFILES += \
#     ../Info.plist \
#     ../SmartConnect.icns
