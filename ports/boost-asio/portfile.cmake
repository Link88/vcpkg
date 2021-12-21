# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/asio
    REF boost-1.78.0
    SHA512 78c58a64d669eaeabb5ba003200c581065412d33912e641143186ee95c11e0fb0411ed8dbb9a9acced8c8ecd258e0de33872b2e22dfc4a572315cd9a665db8a6
    HEAD_REF master
    PATCHES
        windows_alloca_header.patch
        qt_msvc_compile_fix.patch
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
