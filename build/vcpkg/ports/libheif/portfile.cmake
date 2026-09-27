vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO strukturag/libheif
    REF "v${VERSION}"
    SHA512 a7b4a7ecc093f6b453939e093abef391f88bb371303183a91e431cba8f4b590131c05cc80a28733ac4822cce4a69ca1475251b2d4679890330a603de04c6c77c
    HEAD_REF master
    PATCHES
        cxx-linkage-pkgconfig.diff
        find-modules.diff
        symbol-exports.diff
        ps-customize-build.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_TESTING=OFF
        -DBUILD_DOCUMENTATION=OFF
        -DCMAKE_COMPILE_WARNING_AS_ERROR=OFF
        -DWITH_EXAMPLES=OFF
        -DWITH_EXAMPLE_HEIF_THUMB=OFF
        -DWITH_EXAMPLE_HEIF_VIEW=OFF
        -DWITH_GDK_PIXBUF=OFF
        -DWITH_LIBDE265=ON
        -DWITH_X265=OFF
        -DWITH_KVAZAAR=OFF
        -DWITH_UVG266=OFF
        -DWITH_VVDEC=OFF
        -DWITH_VVENC=OFF
        -DWITH_X264=OFF
        -DWITH_OpenH264_DECODER=OFF
        -DWITH_OpenH264_ENCODER=OFF
        -DWITH_DAV1D=ON
        -DWITH_AOM_DECODER=OFF
        -DWITH_AOM_ENCODER=OFF
        -DWITH_SvtEnc=OFF
        -DWITH_RAV1E=OFF
        -DWITH_JPEG_DECODER=OFF
        -DWITH_JPEG_ENCODER=OFF
        -DWITH_OpenJPEG_DECODER=OFF
        -DWITH_OpenJPEG_ENCODER=OFF
        -DWITH_FFMPEG_DECODER=OFF
        -DWITH_OPENJPH_DECODER=OFF
        -DWITH_OPENJPH_ENCODER=OFF
        -DWITH_UNCOMPRESSED_CODEC=OFF
        -DWITH_WEBCODECS=OFF
        -DWITH_LIBSHARPYUV=OFF
        -DWITH_HEADER_COMPRESSION=OFF
        -DENABLE_PLUGIN_LOADING=OFF
        -DENABLE_MULTITHREADING_SUPPORT=OFF
        -DENABLE_PARALLEL_TILE_DECODING=OFF
)
vcpkg_cmake_install()
vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/libheif")
vcpkg_fixup_pkgconfig()

if (VCPKG_LIBRARY_LINKAGE STREQUAL "dynamic")
    vcpkg_replace_string("${CURRENT_PACKAGES_DIR}/include/libheif/heif_export.h" "!defined(LIBHEIF_STATIC_BUILD)" "1")
else()
    vcpkg_replace_string("${CURRENT_PACKAGES_DIR}/include/libheif/heif_export.h" "!defined(LIBHEIF_STATIC_BUILD)" "0")
endif()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib/libheif" "${CURRENT_PACKAGES_DIR}/debug/lib/libheif")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")
