#!/bin/bash
MAC_APP=iSearch.app
# DBG_PATH=build-SmartConnectLite-Desktop_Qt_5_13_0_clang_64bit-Debug
DBG_PATH=${PWD}/lib
MAC_APP_HELPER=com.cool.iSearch.Helper

mkdir -p ${DBG_PATH}/${MAC_APP}/Contents/Library/LaunchServices

cp ${DBG_PATH}/com.cool.iSearch.Helper ${DBG_PATH}/${MAC_APP}/Contents/Library/LaunchServices

codesign --deep -f -s "Apple Development: yuxing zhang (L5A6LL89N7)"  $DBG_PATH/${MAC_APP_HELPER}
cp $DBG_PATH/${MAC_APP_HELPER}  ${DBG_PATH}/${MAC_APP}/Contents/Library/LaunchServices


codesign --deep -f -s "Apple Development: yuxing zhang (L5A6LL89N7)" ${DBG_PATH}/$MAC_APP


python2 ${PWD}/SMJobBlessUtil.py check ${DBG_PATH}/$MAC_APP
