#!/bin/bash

set -e

[ -n ${ANDROID_SDK_ROOT} ] && unset ANDROID_SDK_ROOT
[ -n ${ANDROID_SDK_ROOT} ] && unset ANDROID_HOME
echo $ANDROID_SDK_ROOT

CPACK_TYPE=TGZ

HUNTER_CONFIGURATION_TYPES=Release
DRISHTI_BUILD_ACF=ON
DRISHTI_BUILD_FACE=ON
DRISHTI_BUILD_HCI=ON
DRISHTI_BUILD_EXAMPLES=ON
DRISHTI_BUILD_DEST=OFF
DRISHTI_BUILD_REGRESSION_FIXED_POINT=ON
DRISHTI_BUILD_REGRESSION_SIMD=ON

DRISHTI_SERIALIZE_WITH_BOOST=ON
DRISHTI_SERIALIZE_WITH_CEREAL=OFF
DRISHTI_SERIALIZE_WITH_CVMATIO=ON

DRISHTI_BUILD_CONFIG=Release

DRISHTI_BUILD_ARGS=\
(
    "HUNTER_CONFIGURATION_TYPES=Release"
    "DRISHTI_BUILD_EXAMPLES=${DRISHTI_BUILD_EXAMPLES}"
    "DRISHTI_BUILD_FACE=${DRISHTI_BUILD_FACE}"
    "DRISHTI_BUILD_ACF=${DRISHTI_BUILD_ACF}"
    "DRISHTI_BUILD_HCI=${DRISHTI_BUILD_HCI}"    
    "DRISHTI_BUILD_DEST=${DRISHTI_BUILD_DEST}"
    "DRISHTI_BUILD_REGRESSION_FIXED_POINT=${DRISHTI_BUILD_REGRESSION_FIXED_POINT}"
    "DRISHTI_BUILD_REGRESSION_SIMD=${DRISHTI_BUILD_REGRESSION_SIMD}"
    "DRISHTI_SERIALIZE_WITH_BOOST=${DRISHTI_SERIALIZE_WITH_BOOST} "
    "DRISHTI_SERIALIZE_WITH_CEREAL=${DRISHTI_SERIALIZE_WITH_CEREAL} "
    "DRISHTI_SERIALIZE_WITH_CVMATIO=${DRISHTI_SERIALIZE_WITH_CVMATIO} "    
)

DRISHTI_BUILD_HIDE=\
(
    "CMAKE_VISIBILITY_INLINES_HIDDEN=ON"
    "CMAKE_CXX_VISIBILITY_PRESET=hidden"
    "CMAKE_XCODE_ATTRIBUTE_GCC_INLINES_ARE_PRIVATE_EXTERN=YES"
    "CMAKE_XCODE_ATTRIBUTE_GCC_SYMBOLS_PRIVATE_EXTERN=YES"
)

DRISHTI_POLLY_ARGS=\
(
    "--config=${DRISHTI_BUILD_CONFIG}"    
)

function rename_tab
{
  echo -ne "\033]0;$1:$2\007"
}
