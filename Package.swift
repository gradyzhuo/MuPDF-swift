// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MuPDF",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MuPDF",
            targets: ["MuPDF"]
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MuPDF",
            dependencies: [
               "CMuPDF"
            ]
        ),
        .systemLibrary(
            name: "FreeType",
            pkgConfig: "freetype2",
            providers: [
                .apt(["libfreetype6-dev"]),
                .brew(["freetype"])
            ]),
        .systemLibrary(
            name: "HarfBuzz",
            pkgConfig: "harfbuzz",
            providers: [
                .apt(["libharfbuzz-dev"]),
                .brew(["HarfBuzz"])
            ]),
        .systemLibrary(
            name: "Gumbo",
            pkgConfig: "gumbo",
            providers: [
                .apt(["libgumbo-dev"]),
                .brew(["gumbo-parser"])
            ]),
        .systemLibrary(
            name: "MuJS",
            pkgConfig: "mujs", // 如果 MuJS 提供 pkg-config 文件
            providers: [
                .apt(["mujs-dev"]),
                .brew(["mujs"])
            ]),
        .systemLibrary(
            name: "JPEG",
            pkgConfig: "libjpeg",
            providers: [
                .apt(["libjpeg-turbo8-dev"]),
                .brew(["jpeg-turbo"])
            ]),
        .systemLibrary(
            name: "OpenJPEG",
            pkgConfig: "libopenjp2",
            providers: [
                .apt(["libopenjp2-7-dev"]),
                .brew(["openjpeg"])
            ]),
        .systemLibrary(
            name: "JBIG2",
            pkgConfig: "jbig2dec",
            providers: [
                .apt(["libjbig2dec0-dev"]),
                .brew(["jbig2dec"])
            ]),
        .systemLibrary(
            name: "LCMS2",
            pkgConfig: "lcms2",
            providers: [
                .apt(["liblcms2-dev"]),
                .brew(["little-cms2"])
            ]),
        .systemLibrary(
            name: "Brotli",
            pkgConfig: "libbrotlicommon",
            providers: [
                .apt(["libbrotli-dev"]),
                .brew(["brotli"])
            ]),
        .target(
            name: "CExtract"),
        .target(
            name: "CMuPDF",
            dependencies: [
                "FreeType",
                "HarfBuzz",
                "Gumbo",
                "MuJS",
                "JPEG",
                "CExtract",
                "OpenJPEG",
                "JBIG2",
                "LCMS2",
                "Brotli"
            ],
            sources: [
                "source"
            ],
            cSettings: [
                .headerSearchPath("include"), // MuPDF 核心頭檔案
                .headerSearchPath("source"), // MuPDF 內部實現頭檔案
                .define("FZ_ENABLE_PDF", to: "1"),
                .define("FZ_ENABLE_XPS", to: "1"),
                .define("FZ_ENABLE_HTML", to: "1"),
                .define("FZ_ENABLE_HTML_ENGINE", to: "1"),
                .define("FZ_ENABLE_EPUB", to: "1"),
                .define("FZ_ENABLE_MOBI", to: "1"),
                .define("FZ_ENABLE_FB2", to: "1"),
                .define("FZ_ENABLE_TXT", to: "1"),
                .define("FZ_ENABLE_OFFICE", to: "1"),
                .define("FZ_ENABLE_JS", to: "1"),
                .define("FZ_ENABLE_DOCX_OUTPUT", to: "0"),
                .define("FZ_ENABLE_BARCODE", to: "0"),
                .define("FT_DEBUG_LEVEL_ERROR", to: "1"),
                .define("MEMENTO_MUPDF_HACKS", to: "1"),
                .define("USE_JPIP", to: "1"),
                .define("HAVE_ZXINGCPP", to: "0"),
                .define("HAVE_PTHREAD", to: "1"),
            ],
        ),
        .executableTarget(name: "Demo",
             dependencies: [
                "CMuPDF"
             ]),
        .testTarget(
            name: "MuPDFTests",
            dependencies: ["MuPDF"]
        ),
    ]
)
