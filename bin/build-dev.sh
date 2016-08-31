#!/bin/bash

set -e

[ -n ${ANDROID_SDK_ROOT} ] && unset ANDROID_SDK_ROOT
[ -n ${ANDROID_SDK_ROOT} ] && unset ANDROID_HOME
echo $ANDROID_SDK_ROOT

CMAKE_OSX_SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk

CPACK_TYPE=TGZ

HUNTER_CONFIGURATION_TYPES=Release 
BUILD_PUBLIC_SDK=ON 
BUILD_DRISHTI_ACF=ON
BUILD_DRISHTI_FACE=ON
BUILD_EXAMPLES=ON
BUILD_UTILITIES=ON
BUILD_DEST=OFF
BUILD_REGRESSION_FIXED_POINT=ON
DRISHTI_BUILD_REGRESSION_SIMD=ON

DRISHTI_BUILD_ARGS=\
(
    "HUNTER_CONFIGURATION_TYPES=Release"
    "BUILD_PUBLIC_SDK=${BUILD_PUBLIC_SDK}"
    "BUILD_EXAMPLES=${BUILD_EXAMPLES}"
    "BUILD_UTILITIES=${BUILD_UTILITIES}"
    "BUILD_DRISHTI_FACE=${BUILD_DRISHTI_FACE}"
    "BUILD_DRISHTI_ACF=${BUILD_DRISHTI_ACF}"
    "BUILD_DEST=${BUILD_DEST}"
    "BUILD_REGRESSION_FIXED_POINT=${BUILD_REGRESSION_FIXED_POINT}"
    "DRISHTI_BUILD_REGRESSION_SIMD=${DRISHTI_BUILD_REGRESSION_SIMD}"    
)

DRISHTHI_BUILD_HIDE=\
(
    "CMAKE_VISIBILITY_INLINES_HIDDEN=ON"
    "CMAKE_CXX_VISIBILITY_PRESET=hidden"
    "CMAKE_XCODE_ATTRIBUTE_GCC_INLINES_ARE_PRIVATE_EXTERN=YES"
    "CMAKE_XCODE_ATTRIBUTE_GCC_SYMBOLS_PRIVATE_EXTERN=YES"
)

function rename_tab 
{
	echo -ne "\033]0;$1:$2\007"
}
