#include(fx_common.pri)
ISEARCH_PATH = $$PWD

CONFIG(release,debug|release){
DESTDIR = $$ISEARCH_PATH/librel
}else{
DESTDIR = $$ISEARCH_PATH/lib
}


CONFIG += c++17


QT += uitools
#DEFINES += NO_USE_AUI

DEFINES += NO_USE_CPDF

DEFINES += QTN_NAMESPACE

