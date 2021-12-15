include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gurki/vivid
    REF 0ced0226cdd32baa2921c14e8ed121c52ad17f30 
    SHA512 8ef919ff945da54f5dc7fafc1b61424bd286a10fa93606ad4402517e692de179fc1f170756c184b5811c3a69924179ec9112a869110b5a0be47b16b047a9ad44
    HEAD_REF master
)

if ("tests" IN_LIST FEATURES)
    set(ENABLE_TESTS ON)
else()
    set(ENABLE_TESTS OFF)
endif()

if ("examples" IN_LIST FEATURES)
    set(ENABLE_EXAMPLES ON)
else()
    set(ENABLE_EXAMPLES OFF)
endif()

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
	OPTIONS_DEBUG
        -DCMAKE_DEBUG_POSTFIX=d
)

vcpkg_install_cmake()

vcpkg_copy_pdbs()

file(REMOVE_RECURSE 
    "${CURRENT_PACKAGES_DIR}/debug/share"
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/share/doc"
)

file(INSTALL ${SOURCE_PATH}/LICENSE.md DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)



#vcpkg_test_cmake(PACKAGE_NAME VIVID MODULE)
