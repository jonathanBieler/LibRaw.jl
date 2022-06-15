module LibRaw

using LibRaw_jll
export LibRaw_jll

using CEnum

const __darwin_time_t = Clong

const time_t = __darwin_time_t

@cenum LibRaw_open_flags::UInt32 begin
    LIBRAW_OPEN_BIGFILE = 1
    LIBRAW_OPEN_FILE = 2
end

@cenum LibRaw_openbayer_patterns::UInt32 begin
    LIBRAW_OPENBAYER_RGGB = 148
    LIBRAW_OPENBAYER_BGGR = 22
    LIBRAW_OPENBAYER_GRBG = 97
    LIBRAW_OPENBAYER_GBRG = 73
end

@cenum LibRaw_dngfields_marks::UInt32 begin
    LIBRAW_DNGFM_FORWARDMATRIX = 1
    LIBRAW_DNGFM_ILLUMINANT = 2
    LIBRAW_DNGFM_COLORMATRIX = 4
    LIBRAW_DNGFM_CALIBRATION = 8
    LIBRAW_DNGFM_ANALOGBALANCE = 16
    LIBRAW_DNGFM_BLACK = 32
    LIBRAW_DNGFM_WHITE = 64
    LIBRAW_DNGFM_OPCODE2 = 128
    LIBRAW_DNGFM_LINTABLE = 256
    LIBRAW_DNGFM_CROPORIGIN = 512
    LIBRAW_DNGFM_CROPSIZE = 1024
    LIBRAW_DNGFM_PREVIEWCS = 2048
    LIBRAW_DNGFM_ASSHOTNEUTRAL = 4096
    LIBRAW_DNGFM_BASELINEEXPOSURE = 8192
    LIBRAW_DNGFM_LINEARRESPONSELIMIT = 16384
end

@cenum LibRaw_As_Shot_WB_Applied_codes::UInt32 begin
    LIBRAW_ASWB_APPLIED = 1
    LIBRAW_ASWB_CANON = 2
    LIBRAW_ASWB_NIKON = 4
    LIBRAW_ASWB_NIKON_SRAW = 8
    LIBRAW_ASWB_PENTAX = 16
end

@cenum LibRaw_ExifTagTypes::UInt32 begin
    LIBRAW_EXIFTAG_TYPE_UNKNOWN = 0
    LIBRAW_EXIFTAG_TYPE_BYTE = 1
    LIBRAW_EXIFTAG_TYPE_ASCII = 2
    LIBRAW_EXIFTAG_TYPE_SHORT = 3
    LIBRAW_EXIFTAG_TYPE_LONG = 4
    LIBRAW_EXIFTAG_TYPE_RATIONAL = 5
    LIBRAW_EXIFTAG_TYPE_SBYTE = 6
    LIBRAW_EXIFTAG_TYPE_UNDEFINED = 7
    LIBRAW_EXIFTAG_TYPE_SSHORT = 8
    LIBRAW_EXIFTAG_TYPE_SLONG = 9
    LIBRAW_EXIFTAG_TYPE_SRATIONAL = 10
    LIBRAW_EXIFTAG_TYPE_FLOAT = 11
    LIBRAW_EXIFTAG_TYPE_DOUBLE = 12
    LIBRAW_EXIFTAG_TYPE_IFD = 13
    LIBRAW_EXIFTAG_TYPE_UNICODE = 14
    LIBRAW_EXIFTAG_TYPE_COMPLEX = 15
    LIBRAW_EXIFTAG_TYPE_LONG8 = 16
    LIBRAW_EXIFTAG_TYPE_SLONG8 = 17
    LIBRAW_EXIFTAG_TYPE_IFD8 = 18
end

@cenum LibRaw_whitebalance_code::UInt32 begin
    LIBRAW_WBI_Unknown = 0
    LIBRAW_WBI_Daylight = 1
    LIBRAW_WBI_Fluorescent = 2
    LIBRAW_WBI_Tungsten = 3
    LIBRAW_WBI_Flash = 4
    LIBRAW_WBI_FineWeather = 9
    LIBRAW_WBI_Cloudy = 10
    LIBRAW_WBI_Shade = 11
    LIBRAW_WBI_FL_D = 12
    LIBRAW_WBI_FL_N = 13
    LIBRAW_WBI_FL_W = 14
    LIBRAW_WBI_FL_WW = 15
    LIBRAW_WBI_FL_L = 16
    LIBRAW_WBI_Ill_A = 17
    LIBRAW_WBI_Ill_B = 18
    LIBRAW_WBI_Ill_C = 19
    LIBRAW_WBI_D55 = 20
    LIBRAW_WBI_D65 = 21
    LIBRAW_WBI_D75 = 22
    LIBRAW_WBI_D50 = 23
    LIBRAW_WBI_StudioTungsten = 24
    LIBRAW_WBI_Sunset = 64
    LIBRAW_WBI_Underwater = 65
    LIBRAW_WBI_FluorescentHigh = 66
    LIBRAW_WBI_HT_Mercury = 67
    LIBRAW_WBI_AsShot = 81
    LIBRAW_WBI_Auto = 82
    LIBRAW_WBI_Custom = 83
    LIBRAW_WBI_Auto1 = 85
    LIBRAW_WBI_Auto2 = 86
    LIBRAW_WBI_Auto3 = 87
    LIBRAW_WBI_Auto4 = 88
    LIBRAW_WBI_Custom1 = 90
    LIBRAW_WBI_Custom2 = 91
    LIBRAW_WBI_Custom3 = 92
    LIBRAW_WBI_Custom4 = 93
    LIBRAW_WBI_Custom5 = 94
    LIBRAW_WBI_Custom6 = 95
    LIBRAW_WBI_PC_Set1 = 96
    LIBRAW_WBI_PC_Set2 = 97
    LIBRAW_WBI_PC_Set3 = 98
    LIBRAW_WBI_PC_Set4 = 99
    LIBRAW_WBI_PC_Set5 = 100
    LIBRAW_WBI_Measured = 110
    LIBRAW_WBI_BW = 120
    LIBRAW_WBI_Kelvin = 254
    LIBRAW_WBI_Other = 255
    LIBRAW_WBI_None = 65535
end

@cenum LibRaw_MultiExposure_related::UInt32 begin
    LIBRAW_ME_NONE = 0
    LIBRAW_ME_SIMPLE = 1
    LIBRAW_ME_OVERLAY = 2
    LIBRAW_ME_HDR = 3
end

@cenum LibRaw_dng_processing::UInt32 begin
    LIBRAW_DNG_NONE = 0
    LIBRAW_DNG_FLOAT = 1
    LIBRAW_DNG_LINEAR = 2
    LIBRAW_DNG_DEFLATE = 4
    LIBRAW_DNG_XTRANS = 8
    LIBRAW_DNG_OTHER = 16
    LIBRAW_DNG_8BIT = 32
    LIBRAW_DNG_ALL = 59
    LIBRAW_DNG_DEFAULT = 39
end

@cenum LibRaw_runtime_capabilities::UInt32 begin
    LIBRAW_CAPS_RAWSPEED = 1
    LIBRAW_CAPS_DNGSDK = 2
    LIBRAW_CAPS_GPRSDK = 4
    LIBRAW_CAPS_UNICODEPATHS = 8
    LIBRAW_CAPS_X3FTOOLS = 16
    LIBRAW_CAPS_RPI6BY9 = 32
end

@cenum LibRaw_colorspace::UInt32 begin
    LIBRAW_COLORSPACE_NotFound = 0
    LIBRAW_COLORSPACE_sRGB = 1
    LIBRAW_COLORSPACE_AdobeRGB = 2
    LIBRAW_COLORSPACE_WideGamutRGB = 3
    LIBRAW_COLORSPACE_ProPhotoRGB = 4
    LIBRAW_COLORSPACE_ICC = 5
    LIBRAW_COLORSPACE_Uncalibrated = 6
    LIBRAW_COLORSPACE_CameraLinearUniWB = 7
    LIBRAW_COLORSPACE_CameraLinear = 8
    LIBRAW_COLORSPACE_CameraGammaUniWB = 9
    LIBRAW_COLORSPACE_CameraGamma = 10
    LIBRAW_COLORSPACE_MonochromeLinear = 11
    LIBRAW_COLORSPACE_MonochromeGamma = 12
    LIBRAW_COLORSPACE_Unknown = 255
end

@cenum LibRaw_cameramaker_index::UInt32 begin
    LIBRAW_CAMERAMAKER_Unknown = 0
    LIBRAW_CAMERAMAKER_Agfa = 1
    LIBRAW_CAMERAMAKER_Alcatel = 2
    LIBRAW_CAMERAMAKER_Apple = 3
    LIBRAW_CAMERAMAKER_Aptina = 4
    LIBRAW_CAMERAMAKER_AVT = 5
    LIBRAW_CAMERAMAKER_Baumer = 6
    LIBRAW_CAMERAMAKER_Broadcom = 7
    LIBRAW_CAMERAMAKER_Canon = 8
    LIBRAW_CAMERAMAKER_Casio = 9
    LIBRAW_CAMERAMAKER_CINE = 10
    LIBRAW_CAMERAMAKER_Clauss = 11
    LIBRAW_CAMERAMAKER_Contax = 12
    LIBRAW_CAMERAMAKER_Creative = 13
    LIBRAW_CAMERAMAKER_DJI = 14
    LIBRAW_CAMERAMAKER_DXO = 15
    LIBRAW_CAMERAMAKER_Epson = 16
    LIBRAW_CAMERAMAKER_Foculus = 17
    LIBRAW_CAMERAMAKER_Fujifilm = 18
    LIBRAW_CAMERAMAKER_Generic = 19
    LIBRAW_CAMERAMAKER_Gione = 20
    LIBRAW_CAMERAMAKER_GITUP = 21
    LIBRAW_CAMERAMAKER_Google = 22
    LIBRAW_CAMERAMAKER_GoPro = 23
    LIBRAW_CAMERAMAKER_Hasselblad = 24
    LIBRAW_CAMERAMAKER_HTC = 25
    LIBRAW_CAMERAMAKER_I_Mobile = 26
    LIBRAW_CAMERAMAKER_Imacon = 27
    LIBRAW_CAMERAMAKER_JK_Imaging = 28
    LIBRAW_CAMERAMAKER_Kodak = 29
    LIBRAW_CAMERAMAKER_Konica = 30
    LIBRAW_CAMERAMAKER_Leaf = 31
    LIBRAW_CAMERAMAKER_Leica = 32
    LIBRAW_CAMERAMAKER_Lenovo = 33
    LIBRAW_CAMERAMAKER_LG = 34
    LIBRAW_CAMERAMAKER_Logitech = 35
    LIBRAW_CAMERAMAKER_Mamiya = 36
    LIBRAW_CAMERAMAKER_Matrix = 37
    LIBRAW_CAMERAMAKER_Meizu = 38
    LIBRAW_CAMERAMAKER_Micron = 39
    LIBRAW_CAMERAMAKER_Minolta = 40
    LIBRAW_CAMERAMAKER_Motorola = 41
    LIBRAW_CAMERAMAKER_NGM = 42
    LIBRAW_CAMERAMAKER_Nikon = 43
    LIBRAW_CAMERAMAKER_Nokia = 44
    LIBRAW_CAMERAMAKER_Olympus = 45
    LIBRAW_CAMERAMAKER_OmniVison = 46
    LIBRAW_CAMERAMAKER_Panasonic = 47
    LIBRAW_CAMERAMAKER_Parrot = 48
    LIBRAW_CAMERAMAKER_Pentax = 49
    LIBRAW_CAMERAMAKER_PhaseOne = 50
    LIBRAW_CAMERAMAKER_PhotoControl = 51
    LIBRAW_CAMERAMAKER_Photron = 52
    LIBRAW_CAMERAMAKER_Pixelink = 53
    LIBRAW_CAMERAMAKER_Polaroid = 54
    LIBRAW_CAMERAMAKER_RED = 55
    LIBRAW_CAMERAMAKER_Ricoh = 56
    LIBRAW_CAMERAMAKER_Rollei = 57
    LIBRAW_CAMERAMAKER_RoverShot = 58
    LIBRAW_CAMERAMAKER_Samsung = 59
    LIBRAW_CAMERAMAKER_Sigma = 60
    LIBRAW_CAMERAMAKER_Sinar = 61
    LIBRAW_CAMERAMAKER_SMaL = 62
    LIBRAW_CAMERAMAKER_Sony = 63
    LIBRAW_CAMERAMAKER_ST_Micro = 64
    LIBRAW_CAMERAMAKER_THL = 65
    LIBRAW_CAMERAMAKER_VLUU = 66
    LIBRAW_CAMERAMAKER_Xiaomi = 67
    LIBRAW_CAMERAMAKER_XIAOYI = 68
    LIBRAW_CAMERAMAKER_YI = 69
    LIBRAW_CAMERAMAKER_Yuneec = 70
    LIBRAW_CAMERAMAKER_Zeiss = 71
    LIBRAW_CAMERAMAKER_TheLastOne = 72
end

@cenum LibRaw_camera_mounts::UInt32 begin
    LIBRAW_MOUNT_Unknown = 0
    LIBRAW_MOUNT_Alpa = 1
    LIBRAW_MOUNT_C = 2
    LIBRAW_MOUNT_Canon_EF_M = 3
    LIBRAW_MOUNT_Canon_EF_S = 4
    LIBRAW_MOUNT_Canon_EF = 5
    LIBRAW_MOUNT_Canon_RF = 6
    LIBRAW_MOUNT_Contax_N = 7
    LIBRAW_MOUNT_Contax645 = 8
    LIBRAW_MOUNT_FT = 9
    LIBRAW_MOUNT_mFT = 10
    LIBRAW_MOUNT_Fuji_GF = 11
    LIBRAW_MOUNT_Fuji_GX = 12
    LIBRAW_MOUNT_Fuji_X = 13
    LIBRAW_MOUNT_Hasselblad_H = 14
    LIBRAW_MOUNT_Hasselblad_V = 15
    LIBRAW_MOUNT_Hasselblad_XCD = 16
    LIBRAW_MOUNT_Leica_M = 17
    LIBRAW_MOUNT_Leica_R = 18
    LIBRAW_MOUNT_Leica_S = 19
    LIBRAW_MOUNT_Leica_SL = 20
    LIBRAW_MOUNT_Leica_TL = 21
    LIBRAW_MOUNT_LPS_L = 22
    LIBRAW_MOUNT_Mamiya67 = 23
    LIBRAW_MOUNT_Mamiya645 = 24
    LIBRAW_MOUNT_Minolta_A = 25
    LIBRAW_MOUNT_Nikon_CX = 26
    LIBRAW_MOUNT_Nikon_F = 27
    LIBRAW_MOUNT_Nikon_Z = 28
    LIBRAW_MOUNT_Pentax_645 = 29
    LIBRAW_MOUNT_Pentax_K = 30
    LIBRAW_MOUNT_Pentax_Q = 31
    LIBRAW_MOUNT_RicohModule = 32
    LIBRAW_MOUNT_Rollei_bayonet = 33
    LIBRAW_MOUNT_Samsung_NX_M = 34
    LIBRAW_MOUNT_Samsung_NX = 35
    LIBRAW_MOUNT_Sigma_X3F = 36
    LIBRAW_MOUNT_Sony_E = 37
    LIBRAW_MOUNT_LF = 38
    LIBRAW_MOUNT_DigitalBack = 39
    LIBRAW_MOUNT_FixedLens = 40
    LIBRAW_MOUNT_IL_UM = 41
    LIBRAW_MOUNT_TheLastOne = 42
end

@cenum LibRaw_camera_formats::UInt32 begin
    LIBRAW_FORMAT_Unknown = 0
    LIBRAW_FORMAT_APSC = 1
    LIBRAW_FORMAT_FF = 2
    LIBRAW_FORMAT_MF = 3
    LIBRAW_FORMAT_APSH = 4
    LIBRAW_FORMAT_1INCH = 5
    LIBRAW_FORMAT_1div2p3INCH = 6
    LIBRAW_FORMAT_1div1p7INCH = 7
    LIBRAW_FORMAT_FT = 8
    LIBRAW_FORMAT_CROP645 = 9
    LIBRAW_FORMAT_LeicaS = 10
    LIBRAW_FORMAT_645 = 11
    LIBRAW_FORMAT_66 = 12
    LIBRAW_FORMAT_69 = 13
    LIBRAW_FORMAT_LF = 14
    LIBRAW_FORMAT_Leica_DMR = 15
    LIBRAW_FORMAT_67 = 16
    LIBRAW_FORMAT_SigmaAPSC = 17
    LIBRAW_FORMAT_SigmaMerrill = 18
    LIBRAW_FORMAT_SigmaAPSH = 19
    LIBRAW_FORMAT_3648 = 20
    LIBRAW_FORMAT_68 = 21
    LIBRAW_FORMAT_TheLastOne = 22
end

@cenum LibRawImageAspects::UInt32 begin
    LIBRAW_IMAGE_ASPECT_UNKNOWN = 0
    LIBRAW_IMAGE_ASPECT_3to2 = 1
    LIBRAW_IMAGE_ASPECT_1to1 = 2
    LIBRAW_IMAGE_ASPECT_4to3 = 3
    LIBRAW_IMAGE_ASPECT_16to9 = 4
    LIBRAW_IMAGE_ASPECT_5to4 = 5
    LIBRAW_IMAGE_ASPECT_OTHER = 6
end

@cenum LibRaw_lens_focal_types::UInt32 begin
    LIBRAW_FT_UNDEFINED = 0
    LIBRAW_FT_PRIME_LENS = 1
    LIBRAW_FT_ZOOM_LENS = 2
    LIBRAW_FT_ZOOM_LENS_CONSTANT_APERTURE = 3
    LIBRAW_FT_ZOOM_LENS_VARIABLE_APERTURE = 4
end

@cenum LibRaw_Canon_RecordModes::UInt32 begin
    LIBRAW_Canon_RecordMode_UNDEFINED = 0
    LIBRAW_Canon_RecordMode_JPEG = 1
    LIBRAW_Canon_RecordMode_CRW_THM = 2
    LIBRAW_Canon_RecordMode_AVI_THM = 3
    LIBRAW_Canon_RecordMode_TIF = 4
    LIBRAW_Canon_RecordMode_TIF_JPEG = 5
    LIBRAW_Canon_RecordMode_CR2 = 6
    LIBRAW_Canon_RecordMode_CR2_JPEG = 7
    LIBRAW_Canon_RecordMode_UNKNOWN = 8
    LIBRAW_Canon_RecordMode_MOV = 9
    LIBRAW_Canon_RecordMode_MP4 = 10
    LIBRAW_Canon_RecordMode_CRM = 11
    LIBRAW_Canon_RecordMode_CR3 = 12
    LIBRAW_Canon_RecordMode_CR3_JPEG = 13
    LIBRAW_Canon_RecordMode_HEIF = 14
    LIBRAW_Canon_RecordMode_CR3_HEIF = 15
    LIBRAW_Canon_RecordMode_TheLastOne = 16
end

@cenum LibRaw_sony_cameratypes::UInt32 begin
    LIBRAW_SONY_DSC = 1
    LIBRAW_SONY_DSLR = 2
    LIBRAW_SONY_NEX = 3
    LIBRAW_SONY_SLT = 4
    LIBRAW_SONY_ILCE = 5
    LIBRAW_SONY_ILCA = 6
end

@cenum LibRaw_KodakSensors::UInt32 begin
    LIBRAW_Kodak_UnknownSensor = 0
    LIBRAW_Kodak_M1 = 1
    LIBRAW_Kodak_M15 = 2
    LIBRAW_Kodak_M16 = 3
    LIBRAW_Kodak_M17 = 4
    LIBRAW_Kodak_M2 = 5
    LIBRAW_Kodak_M23 = 6
    LIBRAW_Kodak_M24 = 7
    LIBRAW_Kodak_M3 = 8
    LIBRAW_Kodak_M5 = 9
    LIBRAW_Kodak_M6 = 10
    LIBRAW_Kodak_C14 = 11
    LIBRAW_Kodak_X14 = 12
    LIBRAW_Kodak_M11 = 13
end

@cenum LibRaw_HasselbladFormatCodes::UInt32 begin
    LIBRAW_HF_Unknown = 0
    LIBRAW_HF_3FR = 1
    LIBRAW_HF_FFF = 2
    LIBRAW_HF_Imacon = 3
    LIBRAW_HF_HasselbladDNG = 4
    LIBRAW_HF_AdobeDNG = 5
    LIBRAW_HF_AdobeDNG_fromPhocusDNG = 6
end

@cenum LibRaw_processing_options::UInt32 begin
    LIBRAW_PROCESSING_SONYARW2_NONE = 0
    LIBRAW_PROCESSING_SONYARW2_BASEONLY = 1
    LIBRAW_PROCESSING_SONYARW2_DELTAONLY = 2
    LIBRAW_PROCESSING_SONYARW2_DELTAZEROBASE = 4
    LIBRAW_PROCESSING_SONYARW2_DELTATOVALUE = 8
    LIBRAW_PROCESSING_SONYARW2_ALLFLAGS = 15
    LIBRAW_PROCESSING_DP2Q_INTERPOLATERG = 16
    LIBRAW_PROCESSING_DP2Q_INTERPOLATEAF = 32
    LIBRAW_PROCESSING_PENTAX_PS_ALLFRAMES = 64
    LIBRAW_PROCESSING_CONVERTFLOAT_TO_INT = 128
    LIBRAW_PROCESSING_SRAW_NO_RGB = 256
    LIBRAW_PROCESSING_SRAW_NO_INTERPOLATE = 512
    LIBRAW_PROCESSING_ARQ_SKIP_CHANNEL_SWAP = 1024
    LIBRAW_PROCESSING_NO_ROTATE_FOR_KODAK_THUMBNAILS = 2048
    LIBRAW_PROCESSING_USE_DNG_DEFAULT_CROP = 4096
    LIBRAW_PROCESSING_USE_PPM16_THUMBS = 8192
    LIBRAW_PROCESSING_SKIP_MAKERNOTES = 16384
    LIBRAW_PROCESSING_DONT_CHECK_DNG_ILLUMINANT = 32768
    LIBRAW_PROCESSING_DNGSDK_ZEROCOPY = 65536
    LIBRAW_PROCESSING_ZEROFILTERS_FOR_MONOCHROMETIFFS = 131072
    LIBRAW_PROCESSING_DNG_ADD_ENHANCED = 262144
    LIBRAW_PROCESSING_DNG_ADD_PREVIEWS = 524288
    LIBRAW_PROCESSING_DNG_PREFER_LARGEST_IMAGE = 1048576
    LIBRAW_PROCESSING_DNG_STAGE2 = 2097152
    LIBRAW_PROCESSING_DNG_STAGE3 = 4194304
    LIBRAW_PROCESSING_DNG_ALLOWSIZECHANGE = 8388608
    LIBRAW_PROCESSING_DNG_DISABLEWBADJUST = 16777216
    LIBRAW_PROCESSING_PROVIDE_NONSTANDARD_WB = 33554432
    LIBRAW_PROCESSING_CAMERAWB_FALLBACK_TO_DAYLIGHT = 67108864
end

@cenum LibRaw_decoder_flags::UInt32 begin
    LIBRAW_DECODER_HASCURVE = 16
    LIBRAW_DECODER_SONYARW2 = 32
    LIBRAW_DECODER_TRYRAWSPEED = 64
    LIBRAW_DECODER_OWNALLOC = 128
    LIBRAW_DECODER_FIXEDMAXC = 256
    LIBRAW_DECODER_ADOBECOPYPIXEL = 512
    LIBRAW_DECODER_LEGACY_WITH_MARGINS = 1024
    LIBRAW_DECODER_3CHANNEL = 2048
    LIBRAW_DECODER_SINAR4SHOT = 2048
    LIBRAW_DECODER_FLATDATA = 4096
    LIBRAW_DECODER_FLAT_BG2_SWAPPED = 8192
    LIBRAW_DECODER_NOTSET = 32768
end

@cenum LibRaw_constructor_flags::UInt32 begin
    LIBRAW_OPTIONS_NONE = 0
    LIBRAW_OPIONS_NO_MEMERR_CALLBACK = 1
    LIBRAW_OPIONS_NO_DATAERR_CALLBACK = 2
end

@cenum LibRaw_warnings::UInt32 begin
    LIBRAW_WARN_NONE = 0
    LIBRAW_WARN_BAD_CAMERA_WB = 4
    LIBRAW_WARN_NO_METADATA = 8
    LIBRAW_WARN_NO_JPEGLIB = 16
    LIBRAW_WARN_NO_EMBEDDED_PROFILE = 32
    LIBRAW_WARN_NO_INPUT_PROFILE = 64
    LIBRAW_WARN_BAD_OUTPUT_PROFILE = 128
    LIBRAW_WARN_NO_BADPIXELMAP = 256
    LIBRAW_WARN_BAD_DARKFRAME_FILE = 512
    LIBRAW_WARN_BAD_DARKFRAME_DIM = 1024
    LIBRAW_WARN_NO_JASPER = 2048
    LIBRAW_WARN_RAWSPEED_PROBLEM = 4096
    LIBRAW_WARN_RAWSPEED_UNSUPPORTED = 8192
    LIBRAW_WARN_RAWSPEED_PROCESSED = 16384
    LIBRAW_WARN_FALLBACK_TO_AHD = 32768
    LIBRAW_WARN_PARSEFUJI_PROCESSED = 65536
    LIBRAW_WARN_DNGSDK_PROCESSED = 131072
    LIBRAW_WARN_DNG_IMAGES_REORDERED = 262144
    LIBRAW_WARN_DNG_STAGE2_APPLIED = 524288
    LIBRAW_WARN_DNG_STAGE3_APPLIED = 1048576
end

@cenum LibRaw_exceptions::UInt32 begin
    LIBRAW_EXCEPTION_NONE = 0
    LIBRAW_EXCEPTION_ALLOC = 1
    LIBRAW_EXCEPTION_DECODE_RAW = 2
    LIBRAW_EXCEPTION_DECODE_JPEG = 3
    LIBRAW_EXCEPTION_IO_EOF = 4
    LIBRAW_EXCEPTION_IO_CORRUPT = 5
    LIBRAW_EXCEPTION_CANCELLED_BY_CALLBACK = 6
    LIBRAW_EXCEPTION_BAD_CROP = 7
    LIBRAW_EXCEPTION_IO_BADFILE = 8
    LIBRAW_EXCEPTION_DECODE_JPEG2000 = 9
    LIBRAW_EXCEPTION_TOOBIG = 10
    LIBRAW_EXCEPTION_MEMPOOL = 11
end

@cenum LibRaw_progress::UInt32 begin
    LIBRAW_PROGRESS_START = 0
    LIBRAW_PROGRESS_OPEN = 1
    LIBRAW_PROGRESS_IDENTIFY = 2
    LIBRAW_PROGRESS_SIZE_ADJUST = 4
    LIBRAW_PROGRESS_LOAD_RAW = 8
    LIBRAW_PROGRESS_RAW2_IMAGE = 16
    LIBRAW_PROGRESS_REMOVE_ZEROES = 32
    LIBRAW_PROGRESS_BAD_PIXELS = 64
    LIBRAW_PROGRESS_DARK_FRAME = 128
    LIBRAW_PROGRESS_FOVEON_INTERPOLATE = 256
    LIBRAW_PROGRESS_SCALE_COLORS = 512
    LIBRAW_PROGRESS_PRE_INTERPOLATE = 1024
    LIBRAW_PROGRESS_INTERPOLATE = 2048
    LIBRAW_PROGRESS_MIX_GREEN = 4096
    LIBRAW_PROGRESS_MEDIAN_FILTER = 8192
    LIBRAW_PROGRESS_HIGHLIGHTS = 16384
    LIBRAW_PROGRESS_FUJI_ROTATE = 32768
    LIBRAW_PROGRESS_FLIP = 65536
    LIBRAW_PROGRESS_APPLY_PROFILE = 131072
    LIBRAW_PROGRESS_CONVERT_RGB = 262144
    LIBRAW_PROGRESS_STRETCH = 524288
    LIBRAW_PROGRESS_STAGE20 = 1048576
    LIBRAW_PROGRESS_STAGE21 = 2097152
    LIBRAW_PROGRESS_STAGE22 = 4194304
    LIBRAW_PROGRESS_STAGE23 = 8388608
    LIBRAW_PROGRESS_STAGE24 = 16777216
    LIBRAW_PROGRESS_STAGE25 = 33554432
    LIBRAW_PROGRESS_STAGE26 = 67108864
    LIBRAW_PROGRESS_STAGE27 = 134217728
    LIBRAW_PROGRESS_THUMB_LOAD = 268435456
    LIBRAW_PROGRESS_TRESERVED1 = 536870912
    LIBRAW_PROGRESS_TRESERVED2 = 1073741824
end

@cenum LibRaw_errors::Int32 begin
    LIBRAW_SUCCESS = 0
    LIBRAW_UNSPECIFIED_ERROR = -1
    LIBRAW_FILE_UNSUPPORTED = -2
    LIBRAW_REQUEST_FOR_NONEXISTENT_IMAGE = -3
    LIBRAW_OUT_OF_ORDER_CALL = -4
    LIBRAW_NO_THUMBNAIL = -5
    LIBRAW_UNSUPPORTED_THUMBNAIL = -6
    LIBRAW_INPUT_CLOSED = -7
    LIBRAW_NOT_IMPLEMENTED = -8
    LIBRAW_UNSUFFICIENT_MEMORY = -100007
    LIBRAW_DATA_ERROR = -100008
    LIBRAW_IO_ERROR = -100009
    LIBRAW_CANCELLED_BY_CALLBACK = -100010
    LIBRAW_BAD_CROP = -100011
    LIBRAW_TOO_BIG = -100012
    LIBRAW_MEMPOOL_OVERFLOW = -100013
end

@cenum LibRaw_thumbnail_formats::UInt32 begin
    LIBRAW_THUMBNAIL_UNKNOWN = 0
    LIBRAW_THUMBNAIL_JPEG = 1
    LIBRAW_THUMBNAIL_BITMAP = 2
    LIBRAW_THUMBNAIL_BITMAP16 = 3
    LIBRAW_THUMBNAIL_LAYER = 4
    LIBRAW_THUMBNAIL_ROLLEI = 5
end

@cenum LibRaw_image_formats::UInt32 begin
    LIBRAW_IMAGE_JPEG = 1
    LIBRAW_IMAGE_BITMAP = 2
end

const INT64 = Clonglong

const UINT64 = Culonglong

const uchar = Cuchar

const ushort = Cushort

struct libraw_decoder_info_t
    decoder_name::Ptr{Cchar}
    decoder_flags::Cuint
end

struct libraw_internal_output_params_t
    mix_green::Cuint
    raw_color::Cuint
    zero_is_bad::Cuint
    shrink::ushort
    fuji_width::ushort
end

# typedef void ( * memory_callback ) ( void * data , const char * file , const char * where )
const memory_callback = Ptr{Cvoid}

# typedef void ( * exif_parser_callback ) ( void * context , int tag , int type , int len , unsigned int ord , void * ifp , INT64 base )
const exif_parser_callback = Ptr{Cvoid}

function default_memory_callback(data, file, where)
    ccall((:default_memory_callback, libraw), Cvoid, (Ptr{Cvoid}, Ptr{Cchar}, Ptr{Cchar}), data, file, where)
end

# typedef void ( * data_callback ) ( void * data , const char * file , const int offset )
const data_callback = Ptr{Cvoid}

function default_data_callback(data, file, offset)
    ccall((:default_data_callback, libraw), Cvoid, (Ptr{Cvoid}, Ptr{Cchar}, Cint), data, file, offset)
end

# typedef int ( * progress_callback ) ( void * data , enum LibRaw_progress stage , int iteration , int expected )
const progress_callback = Ptr{Cvoid}

# typedef int ( * pre_identify_callback ) ( void * ctx )
const pre_identify_callback = Ptr{Cvoid}

# typedef void ( * post_identify_callback ) ( void * ctx )
const post_identify_callback = Ptr{Cvoid}

# typedef void ( * process_step_callback ) ( void * ctx )
const process_step_callback = Ptr{Cvoid}

struct libraw_callbacks_t
    mem_cb::memory_callback
    memcb_data::Ptr{Cvoid}
    data_cb::data_callback
    datacb_data::Ptr{Cvoid}
    progress_cb::progress_callback
    progresscb_data::Ptr{Cvoid}
    exif_cb::exif_parser_callback
    exifparser_data::Ptr{Cvoid}
    pre_identify_cb::pre_identify_callback
    post_identify_cb::post_identify_callback
    pre_subtractblack_cb::process_step_callback
    pre_scalecolors_cb::process_step_callback
    pre_preinterpolate_cb::process_step_callback
    pre_interpolate_cb::process_step_callback
    interpolate_bayer_cb::process_step_callback
    interpolate_xtrans_cb::process_step_callback
    post_interpolate_cb::process_step_callback
    pre_converttorgb_cb::process_step_callback
    post_converttorgb_cb::process_step_callback
end

struct libraw_processed_image_t
    type::LibRaw_image_formats
    height::ushort
    width::ushort
    colors::ushort
    bits::ushort
    data_size::Cuint
    data::NTuple{1, Cuchar}
end

struct libraw_iparams_t
    guard::NTuple{4, Cchar}
    make::NTuple{64, Cchar}
    model::NTuple{64, Cchar}
    software::NTuple{64, Cchar}
    normalized_make::NTuple{64, Cchar}
    normalized_model::NTuple{64, Cchar}
    maker_index::Cuint
    raw_count::Cuint
    dng_version::Cuint
    is_foveon::Cuint
    colors::Cint
    filters::Cuint
    xtrans::NTuple{6, NTuple{6, Cchar}}
    xtrans_abs::NTuple{6, NTuple{6, Cchar}}
    cdesc::NTuple{5, Cchar}
    xmplen::Cuint
    xmpdata::Ptr{Cchar}
end

struct libraw_raw_inset_crop_t
    cleft::ushort
    ctop::ushort
    cwidth::ushort
    cheight::ushort
    aspect::ushort
end

struct libraw_image_sizes_t
    raw_height::ushort
    raw_width::ushort
    height::ushort
    width::ushort
    top_margin::ushort
    left_margin::ushort
    iheight::ushort
    iwidth::ushort
    raw_pitch::Cuint
    pixel_aspect::Cdouble
    flip::Cint
    mask::NTuple{8, NTuple{4, Cint}}
    raw_inset_crop::libraw_raw_inset_crop_t
end

struct ph1_t
    format::Cint
    key_off::Cint
    tag_21a::Cint
    t_black::Cint
    split_col::Cint
    black_col::Cint
    split_row::Cint
    black_row::Cint
    tag_210::Cfloat
end

struct libraw_dng_color_t
    parsedfields::Cuint
    illuminant::ushort
    calibration::NTuple{4, NTuple{4, Cfloat}}
    colormatrix::NTuple{4, NTuple{3, Cfloat}}
    forwardmatrix::NTuple{3, NTuple{4, Cfloat}}
end

struct libraw_dng_levels_t
    parsedfields::Cuint
    dng_cblack::NTuple{4104, Cuint}
    dng_black::Cuint
    dng_fcblack::NTuple{4104, Cfloat}
    dng_fblack::Cfloat
    dng_whitelevel::NTuple{4, Cuint}
    default_crop::NTuple{4, Cuint}
    preview_colorspace::Cuint
    analogbalance::NTuple{4, Cfloat}
    asshotneutral::NTuple{4, Cfloat}
    baseline_exposure::Cfloat
    LinearResponseLimit::Cfloat
end

struct libraw_P1_color_t
    romm_cam::NTuple{9, Cfloat}
end

struct libraw_canon_makernotes_t
    ColorDataVer::Cint
    ColorDataSubVer::Cint
    SpecularWhiteLevel::Cint
    NormalWhiteLevel::Cint
    ChannelBlackLevel::NTuple{4, Cint}
    AverageBlackLevel::Cint
    multishot::NTuple{4, Cuint}
    MeteringMode::Cshort
    SpotMeteringMode::Cshort
    FlashMeteringMode::uchar
    FlashExposureLock::Cshort
    ExposureMode::Cshort
    AESetting::Cshort
    HighlightTonePriority::uchar
    ImageStabilization::Cshort
    FocusMode::Cshort
    AFPoint::Cshort
    FocusContinuous::Cshort
    AFPointsInFocus30D::Cshort
    AFPointsInFocus1D::NTuple{8, uchar}
    AFPointsInFocus5D::ushort
    AFAreaMode::ushort
    NumAFPoints::ushort
    ValidAFPoints::ushort
    AFImageWidth::ushort
    AFImageHeight::ushort
    AFAreaWidths::NTuple{61, Cshort}
    AFAreaHeights::NTuple{61, Cshort}
    AFAreaXPositions::NTuple{61, Cshort}
    AFAreaYPositions::NTuple{61, Cshort}
    AFPointsInFocus::NTuple{4, Cshort}
    AFPointsSelected::NTuple{4, Cshort}
    PrimaryAFPoint::ushort
    FlashMode::Cshort
    FlashActivity::Cshort
    FlashBits::Cshort
    ManualFlashOutput::Cshort
    FlashOutput::Cshort
    FlashGuideNumber::Cshort
    ContinuousDrive::Cshort
    SensorWidth::Cshort
    SensorHeight::Cshort
    SensorLeftBorder::Cshort
    SensorTopBorder::Cshort
    SensorRightBorder::Cshort
    SensorBottomBorder::Cshort
    BlackMaskLeftBorder::Cshort
    BlackMaskTopBorder::Cshort
    BlackMaskRightBorder::Cshort
    BlackMaskBottomBorder::Cshort
    AFMicroAdjMode::Cint
    AFMicroAdjValue::Cfloat
    MakernotesFlip::Cshort
    RecordMode::Cshort
    SRAWQuality::Cshort
    wbi::Cuint
    firmware::Cfloat
    RF_lensID::Cshort
end

struct libraw_hasselblad_makernotes_t
    BaseISO::Cint
    Gain::Cdouble
    Sensor::NTuple{8, Cchar}
    SensorUnit::NTuple{64, Cchar}
    HostBody::NTuple{64, Cchar}
    SensorCode::Cint
    SensorSubCode::Cint
    CoatingCode::Cint
    uncropped::Cint
    CaptureSequenceInitiator::NTuple{32, Cchar}
    SensorUnitConnector::NTuple{64, Cchar}
    format::Cint
    nIFD_CM::NTuple{2, Cint}
    RecommendedCrop::NTuple{2, Cint}
    mnColorMatrix::NTuple{4, NTuple{3, Cdouble}}
end

struct libraw_fuji_info_t
    ExpoMidPointShift::Cfloat
    DynamicRange::ushort
    FilmMode::ushort
    DynamicRangeSetting::ushort
    DevelopmentDynamicRange::ushort
    AutoDynamicRange::ushort
    DRangePriority::ushort
    DRangePriorityAuto::ushort
    DRangePriorityFixed::ushort
    BrightnessCompensation::Cfloat
    FocusMode::ushort
    AFMode::ushort
    FocusPixel::NTuple{2, ushort}
    ImageStabilization::NTuple{3, ushort}
    FlashMode::ushort
    WB_Preset::ushort
    ShutterType::ushort
    ExrMode::ushort
    Macro::ushort
    Rating::Cuint
    CropMode::ushort
    FrameRate::ushort
    FrameWidth::ushort
    FrameHeight::ushort
    SerialSignature::NTuple{13, Cchar}
    RAFVersion::NTuple{5, Cchar}
    RAFDataVersion::ushort
    isTSNERDTS::Cint
    DriveMode::Cshort
end

struct libraw_sensor_highspeed_crop_t
    cleft::ushort
    ctop::ushort
    cwidth::ushort
    cheight::ushort
end

struct libraw_nikon_makernotes_t
    ExposureBracketValue::Cdouble
    ActiveDLighting::ushort
    ShootingMode::ushort
    ImageStabilization::NTuple{7, uchar}
    VibrationReduction::uchar
    VRMode::uchar
    FocusMode::NTuple{7, Cchar}
    AFPoint::uchar
    AFPointsInFocus::ushort
    ContrastDetectAF::uchar
    AFAreaMode::uchar
    PhaseDetectAF::uchar
    PrimaryAFPoint::uchar
    AFPointsUsed::NTuple{29, uchar}
    AFImageWidth::ushort
    AFImageHeight::ushort
    AFAreaXPposition::ushort
    AFAreaYPosition::ushort
    AFAreaWidth::ushort
    AFAreaHeight::ushort
    ContrastDetectAFInFocus::uchar
    FlashSetting::NTuple{13, Cchar}
    FlashType::NTuple{20, Cchar}
    FlashExposureCompensation::NTuple{4, uchar}
    ExternalFlashExposureComp::NTuple{4, uchar}
    FlashExposureBracketValue::NTuple{4, uchar}
    FlashMode::uchar
    FlashExposureCompensation2::Int8
    FlashExposureCompensation3::Int8
    FlashExposureCompensation4::Int8
    FlashSource::uchar
    FlashFirmware::NTuple{2, uchar}
    ExternalFlashFlags::uchar
    FlashControlCommanderMode::uchar
    FlashOutputAndCompensation::uchar
    FlashFocalLength::uchar
    FlashGNDistance::uchar
    FlashGroupControlMode::NTuple{4, uchar}
    FlashGroupOutputAndCompensation::NTuple{4, uchar}
    FlashColorFilter::uchar
    NEFCompression::ushort
    ExposureMode::Cint
    ExposureProgram::Cint
    nMEshots::Cint
    MEgainOn::Cint
    ME_WB::NTuple{4, Cdouble}
    AFFineTune::uchar
    AFFineTuneIndex::uchar
    AFFineTuneAdj::Int8
    LensDataVersion::Cuint
    FlashInfoVersion::Cuint
    ColorBalanceVersion::Cuint
    key::uchar
    NEFBitDepth::NTuple{4, ushort}
    HighSpeedCropFormat::ushort
    SensorHighSpeedCrop::libraw_sensor_highspeed_crop_t
    SensorWidth::ushort
    SensorHeight::ushort
end

struct libraw_olympus_makernotes_t
    SensorCalibration::NTuple{2, Cint}
    FocusMode::NTuple{2, ushort}
    AutoFocus::ushort
    AFPoint::ushort
    AFAreas::NTuple{64, Cuint}
    AFPointSelected::NTuple{5, Cdouble}
    AFResult::ushort
    DriveMode::NTuple{5, ushort}
    ColorSpace::ushort
    AFFineTune::uchar
    AFFineTuneAdj::NTuple{3, Cshort}
    CameraType2::NTuple{6, Cchar}
end

struct libraw_panasonic_makernotes_t
    Compression::ushort
    BlackLevelDim::ushort
    BlackLevel::NTuple{8, Cfloat}
    Multishot::Cuint
    gamma::Cfloat
    HighISOMultiplier::NTuple{3, Cint}
end

struct libraw_pentax_makernotes_t
    FocusMode::ushort
    AFPointSelected::ushort
    AFPointsInFocus::Cuint
    FocusPosition::ushort
    DriveMode::NTuple{4, uchar}
    AFAdjustment::Cshort
    MultiExposure::uchar
    Quality::ushort
end

struct libraw_samsung_makernotes_t
    ImageSizeFull::NTuple{4, Cuint}
    ImageSizeCrop::NTuple{4, Cuint}
    ColorSpace::NTuple{2, Cint}
    key::NTuple{11, Cuint}
    DigitalGain::Cdouble
    DeviceType::Cint
    LensFirmware::NTuple{32, Cchar}
end

struct libraw_kodak_makernotes_t
    BlackLevelTop::ushort
    BlackLevelBottom::ushort
    offset_left::Cshort
    offset_top::Cshort
    clipBlack::ushort
    clipWhite::ushort
    romm_camDaylight::NTuple{3, NTuple{3, Cfloat}}
    romm_camTungsten::NTuple{3, NTuple{3, Cfloat}}
    romm_camFluorescent::NTuple{3, NTuple{3, Cfloat}}
    romm_camFlash::NTuple{3, NTuple{3, Cfloat}}
    romm_camCustom::NTuple{3, NTuple{3, Cfloat}}
    romm_camAuto::NTuple{3, NTuple{3, Cfloat}}
    val018percent::ushort
    val100percent::ushort
    val170percent::ushort
    MakerNoteKodak8a::Cshort
    ISOCalibrationGain::Cfloat
    AnalogISO::Cfloat
end

struct libraw_p1_makernotes_t
    Software::NTuple{64, Cchar}
    SystemType::NTuple{64, Cchar}
    FirmwareString::NTuple{256, Cchar}
    SystemModel::NTuple{64, Cchar}
end

struct libraw_sony_info_t
    CameraType::ushort
    Sony0x9400_version::uchar
    Sony0x9400_ReleaseMode2::uchar
    Sony0x9400_SequenceImageNumber::Cuint
    Sony0x9400_SequenceLength1::uchar
    Sony0x9400_SequenceFileNumber::Cuint
    Sony0x9400_SequenceLength2::uchar
    AFAreaModeSetting::UInt8
    FlexibleSpotPosition::NTuple{2, ushort}
    AFPointSelected::UInt8
    AFPointsUsed::NTuple{10, UInt8}
    AFTracking::UInt8
    AFType::UInt8
    FocusLocation::NTuple{4, ushort}
    AFMicroAdjValue::Int8
    AFMicroAdjOn::Int8
    AFMicroAdjRegisteredLenses::uchar
    VariableLowPassFilter::ushort
    LongExposureNoiseReduction::Cuint
    HighISONoiseReduction::ushort
    HDR::NTuple{2, ushort}
    group2010::ushort
    real_iso_offset::ushort
    MeteringMode_offset::ushort
    ExposureProgram_offset::ushort
    ReleaseMode2_offset::ushort
    MinoltaCamID::Cuint
    firmware::Cfloat
    ImageCount3_offset::ushort
    ImageCount3::Cuint
    ElectronicFrontCurtainShutter::Cuint
    MeteringMode2::ushort
    SonyDateTime::NTuple{20, Cchar}
    ShotNumberSincePowerUp::Cuint
    PixelShiftGroupPrefix::ushort
    PixelShiftGroupID::Cuint
    nShotsInPixelShiftGroup::Cchar
    numInPixelShiftGroup::Cchar
    prd_ImageHeight::ushort
    prd_ImageWidth::ushort
    prd_RawBitDepth::ushort
    prd_StorageMethod::ushort
    prd_BayerPattern::ushort
    SonyRawFileType::ushort
    RAWFileType::ushort
    Quality::Cuint
    FileFormat::ushort
end

struct libraw_colordata_t
    curve::NTuple{65536, ushort}
    cblack::NTuple{4104, Cuint}
    black::Cuint
    data_maximum::Cuint
    maximum::Cuint
    linear_max::NTuple{4, Clong}
    fmaximum::Cfloat
    fnorm::Cfloat
    white::NTuple{8, NTuple{8, ushort}}
    cam_mul::NTuple{4, Cfloat}
    pre_mul::NTuple{4, Cfloat}
    cmatrix::NTuple{3, NTuple{4, Cfloat}}
    ccm::NTuple{3, NTuple{4, Cfloat}}
    rgb_cam::NTuple{3, NTuple{4, Cfloat}}
    cam_xyz::NTuple{4, NTuple{3, Cfloat}}
    phase_one_data::ph1_t
    flash_used::Cfloat
    canon_ev::Cfloat
    model2::NTuple{64, Cchar}
    UniqueCameraModel::NTuple{64, Cchar}
    LocalizedCameraModel::NTuple{64, Cchar}
    ImageUniqueID::NTuple{64, Cchar}
    RawDataUniqueID::NTuple{17, Cchar}
    OriginalRawFileName::NTuple{64, Cchar}
    profile::Ptr{Cvoid}
    profile_length::Cuint
    black_stat::NTuple{8, Cuint}
    dng_color::NTuple{2, libraw_dng_color_t}
    dng_levels::libraw_dng_levels_t
    WB_Coeffs::NTuple{256, NTuple{4, Cint}}
    WBCT_Coeffs::NTuple{64, NTuple{5, Cfloat}}
    as_shot_wb_applied::Cint
    P1_color::NTuple{2, libraw_P1_color_t}
    raw_bps::Cuint
    ExifColorSpace::Cint
end

struct libraw_thumbnail_t
    tformat::LibRaw_thumbnail_formats
    twidth::ushort
    theight::ushort
    tlength::Cuint
    tcolors::Cint
    thumb::Ptr{Cchar}
end

struct libraw_gps_info_t
    latitude::NTuple{3, Cfloat}
    longitude::NTuple{3, Cfloat}
    gpstimestamp::NTuple{3, Cfloat}
    altitude::Cfloat
    altref::Cchar
    latref::Cchar
    longref::Cchar
    gpsstatus::Cchar
    gpsparsed::Cchar
end

struct libraw_imgother_t
    iso_speed::Cfloat
    shutter::Cfloat
    aperture::Cfloat
    focal_len::Cfloat
    timestamp::time_t
    shot_order::Cuint
    gpsdata::NTuple{32, Cuint}
    parsed_gps::libraw_gps_info_t
    desc::NTuple{512, Cchar}
    artist::NTuple{64, Cchar}
    analogbalance::NTuple{4, Cfloat}
end

struct libraw_metadata_common_t
    FlashEC::Cfloat
    FlashGN::Cfloat
    CameraTemperature::Cfloat
    SensorTemperature::Cfloat
    SensorTemperature2::Cfloat
    LensTemperature::Cfloat
    AmbientTemperature::Cfloat
    BatteryTemperature::Cfloat
    exifAmbientTemperature::Cfloat
    exifHumidity::Cfloat
    exifPressure::Cfloat
    exifWaterDepth::Cfloat
    exifAcceleration::Cfloat
    exifCameraElevationAngle::Cfloat
    real_ISO::Cfloat
    exifExposureIndex::Cfloat
    ColorSpace::ushort
    firmware::NTuple{128, Cchar}
end

struct libraw_output_params_t
    greybox::NTuple{4, Cuint}
    cropbox::NTuple{4, Cuint}
    aber::NTuple{4, Cdouble}
    gamm::NTuple{6, Cdouble}
    user_mul::NTuple{4, Cfloat}
    shot_select::Cuint
    bright::Cfloat
    threshold::Cfloat
    half_size::Cint
    four_color_rgb::Cint
    highlight::Cint
    use_auto_wb::Cint
    use_camera_wb::Cint
    use_camera_matrix::Cint
    output_color::Cint
    output_profile::Ptr{Cchar}
    camera_profile::Ptr{Cchar}
    bad_pixels::Ptr{Cchar}
    dark_frame::Ptr{Cchar}
    output_bps::Cint
    output_tiff::Cint
    user_flip::Cint
    user_qual::Cint
    user_black::Cint
    user_cblack::NTuple{4, Cint}
    user_sat::Cint
    med_passes::Cint
    auto_bright_thr::Cfloat
    adjust_maximum_thr::Cfloat
    no_auto_bright::Cint
    use_fuji_rotate::Cint
    green_matching::Cint
    dcb_iterations::Cint
    dcb_enhance_fl::Cint
    fbdd_noiserd::Cint
    exp_correc::Cint
    exp_shift::Cfloat
    exp_preser::Cfloat
    use_rawspeed::Cint
    use_dngsdk::Cint
    no_auto_scale::Cint
    no_interpolation::Cint
    raw_processing_options::Cuint
    max_raw_memory_mb::Cuint
    sony_arw2_posterization_thr::Cint
    coolscan_nef_gamma::Cfloat
    p4shot_order::NTuple{5, Cchar}
    custom_camera_strings::Ptr{Ptr{Cchar}}
end

struct libraw_rawdata_t
    raw_alloc::Ptr{Cvoid}
    raw_image::Ptr{ushort}
    color4_image::Ptr{NTuple{4, ushort}}
    color3_image::Ptr{NTuple{3, ushort}}
    float_image::Ptr{Cfloat}
    float3_image::Ptr{NTuple{3, Cfloat}}
    float4_image::Ptr{NTuple{4, Cfloat}}
    ph1_cblack::Ptr{NTuple{2, Cshort}}
    ph1_rblack::Ptr{NTuple{2, Cshort}}
    iparams::libraw_iparams_t
    sizes::libraw_image_sizes_t
    ioparams::libraw_internal_output_params_t
    color::libraw_colordata_t
end

struct libraw_makernotes_lens_t
    LensID::Culonglong
    Lens::NTuple{128, Cchar}
    LensFormat::ushort
    LensMount::ushort
    CamID::Culonglong
    CameraFormat::ushort
    CameraMount::ushort
    body::NTuple{64, Cchar}
    FocalType::Cshort
    LensFeatures_pre::NTuple{16, Cchar}
    LensFeatures_suf::NTuple{16, Cchar}
    MinFocal::Cfloat
    MaxFocal::Cfloat
    MaxAp4MinFocal::Cfloat
    MaxAp4MaxFocal::Cfloat
    MinAp4MinFocal::Cfloat
    MinAp4MaxFocal::Cfloat
    MaxAp::Cfloat
    MinAp::Cfloat
    CurFocal::Cfloat
    CurAp::Cfloat
    MaxAp4CurFocal::Cfloat
    MinAp4CurFocal::Cfloat
    MinFocusDistance::Cfloat
    FocusRangeIndex::Cfloat
    LensFStops::Cfloat
    TeleconverterID::Culonglong
    Teleconverter::NTuple{128, Cchar}
    AdapterID::Culonglong
    Adapter::NTuple{128, Cchar}
    AttachmentID::Culonglong
    Attachment::NTuple{128, Cchar}
    FocalUnits::ushort
    FocalLengthIn35mmFormat::Cfloat
end

struct libraw_nikonlens_t
    EffectiveMaxAp::Cfloat
    LensIDNumber::uchar
    LensFStops::uchar
    MCUVersion::uchar
    LensType::uchar
end

struct libraw_dnglens_t
    MinFocal::Cfloat
    MaxFocal::Cfloat
    MaxAp4MinFocal::Cfloat
    MaxAp4MaxFocal::Cfloat
end

struct libraw_lensinfo_t
    MinFocal::Cfloat
    MaxFocal::Cfloat
    MaxAp4MinFocal::Cfloat
    MaxAp4MaxFocal::Cfloat
    EXIF_MaxAp::Cfloat
    LensMake::NTuple{128, Cchar}
    Lens::NTuple{128, Cchar}
    LensSerial::NTuple{128, Cchar}
    InternalLensSerial::NTuple{128, Cchar}
    FocalLengthIn35mmFormat::ushort
    nikon::libraw_nikonlens_t
    dng::libraw_dnglens_t
    makernotes::libraw_makernotes_lens_t
end

struct libraw_makernotes_t
    canon::libraw_canon_makernotes_t
    nikon::libraw_nikon_makernotes_t
    hasselblad::libraw_hasselblad_makernotes_t
    fuji::libraw_fuji_info_t
    olympus::libraw_olympus_makernotes_t
    sony::libraw_sony_info_t
    kodak::libraw_kodak_makernotes_t
    panasonic::libraw_panasonic_makernotes_t
    pentax::libraw_pentax_makernotes_t
    phaseone::libraw_p1_makernotes_t
    samsung::libraw_samsung_makernotes_t
    common::libraw_metadata_common_t
end

struct libraw_shootinginfo_t
    DriveMode::Cshort
    FocusMode::Cshort
    MeteringMode::Cshort
    AFPoint::Cshort
    ExposureMode::Cshort
    ExposureProgram::Cshort
    ImageStabilization::Cshort
    BodySerial::NTuple{64, Cchar}
    InternalBodySerial::NTuple{64, Cchar}
end

struct libraw_custom_camera_t
    fsize::Cuint
    rw::ushort
    rh::ushort
    lm::uchar
    tm::uchar
    rm::uchar
    bm::uchar
    lf::ushort
    cf::uchar
    max::uchar
    flags::uchar
    t_make::NTuple{10, Cchar}
    t_model::NTuple{20, Cchar}
    offset::ushort
end

struct libraw_data_t
    image::Ptr{NTuple{4, ushort}}
    sizes::libraw_image_sizes_t
    idata::libraw_iparams_t
    lens::libraw_lensinfo_t
    makernotes::libraw_makernotes_t
    shootinginfo::libraw_shootinginfo_t
    params::libraw_output_params_t
    progress_flags::Cuint
    process_warnings::Cuint
    color::libraw_colordata_t
    other::libraw_imgother_t
    thumbnail::libraw_thumbnail_t
    rawdata::libraw_rawdata_t
    parent_class::Ptr{Cvoid}
end

struct fuji_compressed_params
    q_table::Ptr{Int8}
    q_point::NTuple{5, Cint}
    max_bits::Cint
    min_value::Cint
    raw_bits::Cint
    total_values::Cint
    maxDiff::Cint
    line_width::ushort
end

mutable struct LibRaw_abstract_datastream end

struct internal_data_t
    input::Ptr{LibRaw_abstract_datastream}
    output::Ptr{Libc.FILE}
    input_internal::Cint
    meta_data::Ptr{Cchar}
    profile_offset::INT64
    toffset::INT64
    pana_black::NTuple{4, Cuint}
end

struct output_data_t
    histogram::Ptr{NTuple{8192, Cint}}
    oprof::Ptr{Cuint}
end

struct identify_data_t
    olympus_exif_cfa::Cuint
    unique_id::Culonglong
    OlyID::Culonglong
    tiff_nifds::Cuint
    tiff_flip::Cint
    metadata_blocks::Cint
end

struct crx_data_header_t
    version::Int32
    f_width::Int32
    f_height::Int32
    tileWidth::Int32
    tileHeight::Int32
    nBits::Int32
    nPlanes::Int32
    cfaLayout::Int32
    encType::Int32
    imageLevels::Int32
    hasTileCols::Int32
    hasTileRows::Int32
    mdatHdrSize::Int32
    MediaSize::UInt32
    MediaOffset::INT64
    MediaType::UInt32
end

struct unpacker_data_t
    order::Cshort
    sraw_mul::NTuple{4, ushort}
    cr2_slice::NTuple{3, ushort}
    kodak_cbpp::Cuint
    strip_offset::INT64
    data_offset::INT64
    meta_offset::INT64
    data_size::Cuint
    meta_length::Cuint
    thumb_misc::Cuint
    fuji_layout::Cuint
    tiff_samples::Cuint
    tiff_bps::Cuint
    tiff_compress::Cuint
    tiff_sampleformat::Cuint
    zero_after_ff::Cuint
    tile_width::Cuint
    tile_length::Cuint
    load_flags::Cuint
    data_error::Cuint
    hasselblad_parser_flag::Cint
    posRAFData::Clonglong
    lenRAFData::Cuint
    fuji_total_lines::Cint
    fuji_total_blocks::Cint
    fuji_block_width::Cint
    fuji_bits::Cint
    fuji_raw_type::Cint
    pana_encoding::Cint
    pana_bpp::Cint
    crx_header::NTuple{16, crx_data_header_t}
    crx_track_selected::Cint
    CR3_CTMDtag::Cshort
    CR3_Version::Cshort
    CM_found::Cint
    is_NikonTransfer::Cuint
    is_Sony::Cuint
    is_pana_raw::Cuint
    is_4K_RAFdata::Cuint
    is_PentaxRicohMakernotes::Cuint
    dng_frames::NTuple{20, Cuint}
    raw_stride::Cushort
end

struct libraw_internal_data_t
    internal_data::internal_data_t
    internal_output_params::libraw_internal_output_params_t
    output_data::output_data_t
    identify_data::identify_data_t
    unpacker_data::unpacker_data_t
end

struct decode
    branch::NTuple{2, Ptr{decode}}
    leaf::Cint
end

struct tiff_ifd_t
    t_width::Cint
    t_height::Cint
    bps::Cint
    comp::Cint
    phint::Cint
    offset::Cint
    t_flip::Cint
    samples::Cint
    bytes::Cint
    extrasamples::Cint
    t_tile_width::Cint
    t_tile_length::Cint
    sample_format::Cint
    predictor::Cint
    rows_per_strip::Cint
    strip_offsets::Ptr{Cint}
    strip_offsets_count::Cint
    strip_byte_counts::Ptr{Cint}
    strip_byte_counts_count::Cint
    t_filters::Cuint
    t_vwidth::Cint
    t_vheight::Cint
    t_lm::Cint
    t_tm::Cint
    t_fuji_width::Cint
    t_shutter::Cfloat
    opcode2_offset::INT64
    lineartable_offset::INT64
    lineartable_len::Cint
    dng_color::NTuple{2, libraw_dng_color_t}
    dng_levels::libraw_dng_levels_t
    newsubfiletype::Cint
end

struct jhead
    algo::Cint
    bits::Cint
    high::Cint
    wide::Cint
    clrs::Cint
    sraw::Cint
    psv::Cint
    restart::Cint
    vpred::NTuple{6, Cint}
    quant::NTuple{64, ushort}
    idct::NTuple{64, ushort}
    huff::NTuple{20, Ptr{ushort}}
    free::NTuple{20, Ptr{ushort}}
    row::Ptr{ushort}
end

struct var"##Ctag#453"
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{var"##Ctag#453"}, f::Symbol)
    f === :c && return Ptr{NTuple{4, Cchar}}(x + 0)
    f === :s && return Ptr{NTuple{2, Cshort}}(x + 0)
    f === :i && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#453", f::Symbol)
    r = Ref{var"##Ctag#453"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#453"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#453"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct libraw_tiff_tag
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{libraw_tiff_tag}, f::Symbol)
    f === :tag && return Ptr{ushort}(x + 0)
    f === :type && return Ptr{ushort}(x + 2)
    f === :count && return Ptr{Cint}(x + 4)
    f === :val && return Ptr{var"##Ctag#453"}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::libraw_tiff_tag, f::Symbol)
    r = Ref{libraw_tiff_tag}(x)
    ptr = Base.unsafe_convert(Ptr{libraw_tiff_tag}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{libraw_tiff_tag}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct tiff_hdr
    t_order::ushort
    magic::ushort
    ifd::Cint
    pad::ushort
    ntag::ushort
    tag::NTuple{23, libraw_tiff_tag}
    nextifd::Cint
    pad2::ushort
    nexif::ushort
    exif::NTuple{4, libraw_tiff_tag}
    pad3::ushort
    ngps::ushort
    gpst::NTuple{10, libraw_tiff_tag}
    bps::NTuple{4, Cshort}
    rat::NTuple{10, Cint}
    gps::NTuple{26, Cuint}
    t_desc::NTuple{512, Cchar}
    t_make::NTuple{64, Cchar}
    t_model::NTuple{64, Cchar}
    soft::NTuple{32, Cchar}
    date::NTuple{20, Cchar}
    t_artist::NTuple{64, Cchar}
end

function libraw_strerror(errorcode)
    ccall((:libraw_strerror, libraw), Ptr{Cchar}, (Cint,), errorcode)
end

function libraw_strprogress(arg1)
    ccall((:libraw_strprogress, libraw), Ptr{Cchar}, (LibRaw_progress,), arg1)
end

function libraw_init(flags)
    ccall((:libraw_init, libraw), Ptr{libraw_data_t}, (Cuint,), flags)
end

function libraw_open_file(arg1, arg2)
    ccall((:libraw_open_file, libraw), Cint, (Ptr{libraw_data_t}, Ptr{Cchar}), arg1, arg2)
end

function libraw_open_file_ex(arg1, arg2, max_buff_sz)
    ccall((:libraw_open_file_ex, libraw), Cint, (Ptr{libraw_data_t}, Ptr{Cchar}, INT64), arg1, arg2, max_buff_sz)
end

function libraw_open_buffer(arg1, buffer, size)
    ccall((:libraw_open_buffer, libraw), Cint, (Ptr{libraw_data_t}, Ptr{Cvoid}, Csize_t), arg1, buffer, size)
end

function libraw_unpack(arg1)
    ccall((:libraw_unpack, libraw), Cint, (Ptr{libraw_data_t},), arg1)
end

function libraw_unpack_thumb(arg1)
    ccall((:libraw_unpack_thumb, libraw), Cint, (Ptr{libraw_data_t},), arg1)
end

function libraw_recycle_datastream(arg1)
    ccall((:libraw_recycle_datastream, libraw), Cvoid, (Ptr{libraw_data_t},), arg1)
end

function libraw_recycle(arg1)
    ccall((:libraw_recycle, libraw), Cvoid, (Ptr{libraw_data_t},), arg1)
end

function libraw_close(arg1)
    ccall((:libraw_close, libraw), Cvoid, (Ptr{libraw_data_t},), arg1)
end

function libraw_subtract_black(arg1)
    ccall((:libraw_subtract_black, libraw), Cvoid, (Ptr{libraw_data_t},), arg1)
end

function libraw_raw2image(arg1)
    ccall((:libraw_raw2image, libraw), Cint, (Ptr{libraw_data_t},), arg1)
end

function libraw_free_image(arg1)
    ccall((:libraw_free_image, libraw), Cvoid, (Ptr{libraw_data_t},), arg1)
end

# no prototype is found for this function at libraw.h:99:22, please use with caution
function libraw_version()
    ccall((:libraw_version, libraw), Ptr{Cchar}, ())
end

# no prototype is found for this function at libraw.h:100:14, please use with caution
function libraw_versionNumber()
    ccall((:libraw_versionNumber, libraw), Cint, ())
end

# no prototype is found for this function at libraw.h:102:23, please use with caution
function libraw_cameraList()
    ccall((:libraw_cameraList, libraw), Ptr{Ptr{Cchar}}, ())
end

# no prototype is found for this function at libraw.h:103:14, please use with caution
function libraw_cameraCount()
    ccall((:libraw_cameraCount, libraw), Cint, ())
end

function libraw_set_memerror_handler(arg1, cb, datap)
    ccall((:libraw_set_memerror_handler, libraw), Cvoid, (Ptr{libraw_data_t}, memory_callback, Ptr{Cvoid}), arg1, cb, datap)
end

function libraw_set_exifparser_handler(arg1, cb, datap)
    ccall((:libraw_set_exifparser_handler, libraw), Cvoid, (Ptr{libraw_data_t}, exif_parser_callback, Ptr{Cvoid}), arg1, cb, datap)
end

function libraw_set_dataerror_handler(arg1, func, datap)
    ccall((:libraw_set_dataerror_handler, libraw), Cvoid, (Ptr{libraw_data_t}, data_callback, Ptr{Cvoid}), arg1, func, datap)
end

function libraw_set_progress_handler(arg1, cb, datap)
    ccall((:libraw_set_progress_handler, libraw), Cvoid, (Ptr{libraw_data_t}, progress_callback, Ptr{Cvoid}), arg1, cb, datap)
end

function libraw_unpack_function_name(lr)
    ccall((:libraw_unpack_function_name, libraw), Ptr{Cchar}, (Ptr{libraw_data_t},), lr)
end

function libraw_get_decoder_info(lr, d)
    ccall((:libraw_get_decoder_info, libraw), Cint, (Ptr{libraw_data_t}, Ptr{libraw_decoder_info_t}), lr, d)
end

function libraw_COLOR(arg1, row, col)
    ccall((:libraw_COLOR, libraw), Cint, (Ptr{libraw_data_t}, Cint, Cint), arg1, row, col)
end

# no prototype is found for this function at libraw.h:119:19, please use with caution
function libraw_capabilities()
    ccall((:libraw_capabilities, libraw), Cuint, ())
end

function libraw_adjust_sizes_info_only(arg1)
    ccall((:libraw_adjust_sizes_info_only, libraw), Cint, (Ptr{libraw_data_t},), arg1)
end

function libraw_dcraw_ppm_tiff_writer(lr, filename)
    ccall((:libraw_dcraw_ppm_tiff_writer, libraw), Cint, (Ptr{libraw_data_t}, Ptr{Cchar}), lr, filename)
end

function libraw_dcraw_thumb_writer(lr, fname)
    ccall((:libraw_dcraw_thumb_writer, libraw), Cint, (Ptr{libraw_data_t}, Ptr{Cchar}), lr, fname)
end

function libraw_dcraw_process(lr)
    ccall((:libraw_dcraw_process, libraw), Cint, (Ptr{libraw_data_t},), lr)
end

function libraw_dcraw_make_mem_image(lr, errc)
    ccall((:libraw_dcraw_make_mem_image, libraw), Ptr{libraw_processed_image_t}, (Ptr{libraw_data_t}, Ptr{Cint}), lr, errc)
end

function libraw_dcraw_make_mem_thumb(lr, errc)
    ccall((:libraw_dcraw_make_mem_thumb, libraw), Ptr{libraw_processed_image_t}, (Ptr{libraw_data_t}, Ptr{Cint}), lr, errc)
end

function libraw_dcraw_clear_mem(arg1)
    ccall((:libraw_dcraw_clear_mem, libraw), Cvoid, (Ptr{libraw_processed_image_t},), arg1)
end

function libraw_set_demosaic(lr, value)
    ccall((:libraw_set_demosaic, libraw), Cvoid, (Ptr{libraw_data_t}, Cint), lr, value)
end

function libraw_set_output_color(lr, value)
    ccall((:libraw_set_output_color, libraw), Cvoid, (Ptr{libraw_data_t}, Cint), lr, value)
end

function libraw_set_user_mul(lr, index, val)
    ccall((:libraw_set_user_mul, libraw), Cvoid, (Ptr{libraw_data_t}, Cint, Cfloat), lr, index, val)
end

function libraw_set_output_bps(lr, value)
    ccall((:libraw_set_output_bps, libraw), Cvoid, (Ptr{libraw_data_t}, Cint), lr, value)
end

function libraw_set_gamma(lr, index, value)
    ccall((:libraw_set_gamma, libraw), Cvoid, (Ptr{libraw_data_t}, Cint, Cfloat), lr, index, value)
end

function libraw_set_no_auto_bright(lr, value)
    ccall((:libraw_set_no_auto_bright, libraw), Cvoid, (Ptr{libraw_data_t}, Cint), lr, value)
end

function libraw_set_bright(lr, value)
    ccall((:libraw_set_bright, libraw), Cvoid, (Ptr{libraw_data_t}, Cfloat), lr, value)
end

function libraw_set_highlight(lr, value)
    ccall((:libraw_set_highlight, libraw), Cvoid, (Ptr{libraw_data_t}, Cint), lr, value)
end

function libraw_set_fbdd_noiserd(lr, value)
    ccall((:libraw_set_fbdd_noiserd, libraw), Cvoid, (Ptr{libraw_data_t}, Cint), lr, value)
end

function libraw_get_raw_height(lr)
    ccall((:libraw_get_raw_height, libraw), Cint, (Ptr{libraw_data_t},), lr)
end

function libraw_get_raw_width(lr)
    ccall((:libraw_get_raw_width, libraw), Cint, (Ptr{libraw_data_t},), lr)
end

function libraw_get_iheight(lr)
    ccall((:libraw_get_iheight, libraw), Cint, (Ptr{libraw_data_t},), lr)
end

function libraw_get_iwidth(lr)
    ccall((:libraw_get_iwidth, libraw), Cint, (Ptr{libraw_data_t},), lr)
end

function libraw_get_cam_mul(lr, index)
    ccall((:libraw_get_cam_mul, libraw), Cfloat, (Ptr{libraw_data_t}, Cint), lr, index)
end

function libraw_get_pre_mul(lr, index)
    ccall((:libraw_get_pre_mul, libraw), Cfloat, (Ptr{libraw_data_t}, Cint), lr, index)
end

function libraw_get_rgb_cam(lr, index1, index2)
    ccall((:libraw_get_rgb_cam, libraw), Cfloat, (Ptr{libraw_data_t}, Cint, Cint), lr, index1, index2)
end

function libraw_get_color_maximum(lr)
    ccall((:libraw_get_color_maximum, libraw), Cint, (Ptr{libraw_data_t},), lr)
end

function libraw_set_output_tif(lr, value)
    ccall((:libraw_set_output_tif, libraw), Cvoid, (Ptr{libraw_data_t}, Cint), lr, value)
end

function libraw_get_iparams(lr)
    ccall((:libraw_get_iparams, libraw), Ptr{libraw_iparams_t}, (Ptr{libraw_data_t},), lr)
end

function libraw_get_lensinfo(lr)
    ccall((:libraw_get_lensinfo, libraw), Ptr{libraw_lensinfo_t}, (Ptr{libraw_data_t},), lr)
end

function libraw_get_imgother(lr)
    ccall((:libraw_get_imgother, libraw), Ptr{libraw_imgother_t}, (Ptr{libraw_data_t},), lr)
end

const LIBRAW_USE_STREAMS_DATASTREAM_MAXSIZE = 250 * Clong(1024) * Clong(1024)

const LIBRAW_DEFAULT_ADJUST_MAXIMUM_THRESHOLD = 0.75

const LIBRAW_DEFAULT_AUTO_BRIGHTNESS_THRESHOLD = 0.01

const LIBRAW_MAX_ALLOC_MB_DEFAULT = Clong(2048)

const LIBRAW_MAX_THUMBNAIL_MB = Clong(512)

const LIBRAW_MAX_METADATA_BLOCKS = 1024

const LIBRAW_CBLACK_SIZE = 4104

const LIBRAW_IFD_MAXCOUNT = 10

const LIBRAW_CRXTRACKS_MAXCOUNT = 16

const LIBRAW_AHD_TILE = 512

const LIBRAW_EXIFTOOLTAGTYPE_int8u = LIBRAW_EXIFTAG_TYPE_BYTE

const LIBRAW_EXIFTOOLTAGTYPE_string = LIBRAW_EXIFTAG_TYPE_ASCII

const LIBRAW_EXIFTOOLTAGTYPE_int16u = LIBRAW_EXIFTAG_TYPE_SHORT

const LIBRAW_EXIFTOOLTAGTYPE_int32u = LIBRAW_EXIFTAG_TYPE_LONG

const LIBRAW_EXIFTOOLTAGTYPE_rational64u = LIBRAW_EXIFTAG_TYPE_RATIONAL

const LIBRAW_EXIFTOOLTAGTYPE_int8s = LIBRAW_EXIFTAG_TYPE_SBYTE

const LIBRAW_EXIFTOOLTAGTYPE_undef = LIBRAW_EXIFTAG_TYPE_UNDEFINED

const LIBRAW_EXIFTOOLTAGTYPE_binary = LIBRAW_EXIFTAG_TYPE_UNDEFINED

const LIBRAW_EXIFTOOLTAGTYPE_int16s = LIBRAW_EXIFTAG_TYPE_SSHORT

const LIBRAW_EXIFTOOLTAGTYPE_int32s = LIBRAW_EXIFTAG_TYPE_SLONG

const LIBRAW_EXIFTOOLTAGTYPE_rational64s = LIBRAW_EXIFTAG_TYPE_SRATIONAL

const LIBRAW_EXIFTOOLTAGTYPE_float = LIBRAW_EXIFTAG_TYPE_FLOAT

const LIBRAW_EXIFTOOLTAGTYPE_double = LIBRAW_EXIFTAG_TYPE_DOUBLE

const LIBRAW_EXIFTOOLTAGTYPE_ifd = LIBRAW_EXIFTAG_TYPE_IFD

const LIBRAW_EXIFTOOLTAGTYPE_unicode = LIBRAW_EXIFTAG_TYPE_UNICODE

const LIBRAW_EXIFTOOLTAGTYPE_complex = LIBRAW_EXIFTAG_TYPE_COMPLEX

const LIBRAW_EXIFTOOLTAGTYPE_int64u = LIBRAW_EXIFTAG_TYPE_LONG8

const LIBRAW_EXIFTOOLTAGTYPE_int64s = LIBRAW_EXIFTAG_TYPE_SLONG8

const LIBRAW_EXIFTOOLTAGTYPE_ifd64 = LIBRAW_EXIFTAG_TYPE_IFD8

const LIBRAW_LENS_NOT_SET = Culonglong(0xffffffffffffffff)

const LIBRAW_XTRANS = 9

const LIBRAW_PROGRESS_THUMB_MASK = 0x0fffffff

const LIBRAW_MAJOR_VERSION = 0

const LIBRAW_MINOR_VERSION = 20

const LIBRAW_PATCH_VERSION = 2

const LIBRAW_VERSION_TAIL = Release

const LIBRAW_SHLIB_CURRENT = 20

const LIBRAW_SHLIB_REVISION = 0

const LIBRAW_SHLIB_AGE = 0

const LIBRAW_VERSION_STR = LIBRAW_VERSION_MAKE(LIBRAW_MAJOR_VERSION, LIBRAW_MINOR_VERSION, LIBRAW_PATCH_VERSION, LIBRAW_VERSION_TAIL)

const LIBRAW_VERSION = LIBRAW_MAKE_VERSION(LIBRAW_MAJOR_VERSION, LIBRAW_MINOR_VERSION, LIBRAW_PATCH_VERSION)

const LibRawBigEndian = 0

const LIBRAW_HISTOGRAM_SIZE = 0x2000

# exports
const PREFIXES = ["CX", "libraw_"]
for name in names(@__MODULE__; all=true), prefix in PREFIXES
    if startswith(string(name), prefix)
        @eval export $name
    end
end

end # module
