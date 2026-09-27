// Copyright © Clinton Ingram and Contributors
// SPDX-License-Identifier: MIT

// Ported from libheif headers (heif.h)
// Original source Copyright (c) struktur AG, Dirk Farin
// See third-party-notices in the repository root for more information.

namespace PhotoSauce.Interop.Libheif;

internal partial struct heif_ambient_viewing_environment
{
    [NativeTypeName("uint32_t")]
    public uint ambient_illumination;

    [NativeTypeName("uint16_t")]
    public ushort ambient_light_x;

    [NativeTypeName("uint16_t")]
    public ushort ambient_light_y;
}
