// Copyright © Clinton Ingram and Contributors
// SPDX-License-Identifier: MIT

// Ported from libheif headers (heif.h)
// Original source Copyright (c) struktur AG, Dirk Farin
// See third-party-notices in the repository root for more information.

namespace PhotoSauce.Interop.Libheif;

internal partial struct heif_color_conversion_options_ext
{
    [NativeTypeName("uint8_t")]
    public byte version;

    public heif_alpha_composition_mode alpha_composition_mode;

    [NativeTypeName("uint16_t")]
    public ushort background_red;

    [NativeTypeName("uint16_t")]
    public ushort background_green;

    [NativeTypeName("uint16_t")]
    public ushort background_blue;

    [NativeTypeName("uint16_t")]
    public ushort secondary_background_red;

    [NativeTypeName("uint16_t")]
    public ushort secondary_background_green;

    [NativeTypeName("uint16_t")]
    public ushort secondary_background_blue;

    [NativeTypeName("uint16_t")]
    public ushort checkerboard_square_size;
}
