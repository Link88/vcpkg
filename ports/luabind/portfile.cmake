vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO basvloon/luabind
    REF 578ff15f9bf262975b442baa50e43f362333ee09 # 0.9.1
    SHA512 e70a1b3a1b8311421f6355dd2a816652a2b21b9af4d782bb813db3c77bbc7343dbd79babc5ad0985a3f4573edb819365759d548363c395b846550021df52884a
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS)

file(
    COPY ${SOURCE_PATH}/luabind
    DESTINATION ${CURRENT_PACKAGES_DIR}/include
)

vcpkg_install_cmake()

# Include files should not be duplicated into the /debug/include directory
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_copy_pdbs()

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
