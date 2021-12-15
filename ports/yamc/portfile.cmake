#header-only library
include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO yohhoy/yamc
    REF 16b40fb2297a1b4971fa94489a2f4d97a848b9ac
    SHA512 94064a6d96f775986366b55e471c132713d0d3b1b19409a4a66e6e5256080ef03833bc594aa063b57795cfc5f7573911b4a3236c823ed26edb0ddea069590fb9
    HEAD_REF master
)

# Use RapidJSON's own build process, skipping examples and tests
vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
		-DENABLE_TESTING=OFF
)
vcpkg_install_cmake()

#vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/lib ${CURRENT_PACKAGES_DIR}/debug ${CURRENT_PACKAGES_DIR}/share/doc)

#file(READ "${CURRENT_PACKAGES_DIR}/share/rapidjson/yamc.cmake" _contents)
#string(REPLACE "\${RapidJSON_SOURCE_DIR}" "\${yamc_CMAKE_DIR}/../.." _contents "${_contents}")
#file(WRITE "${CURRENT_PACKAGES_DIR}/share/rapidjson/RapidJSONConfig.cmake" "${_contents}\nset(RAPIDJSON_INCLUDE_DIRS \"\${RapidJSON_INCLUDE_DIRS}\")\n")

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

