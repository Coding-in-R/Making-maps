# Loading the libraries
libs <- c("terra", "giscoR", "sf", "tidyverse", "ggtern",
        "elevatr", "png", "rayshader", "magick")


installed_libraries <- libs %in% rownames(installed.packages())

if (any(installed_libraries) == F) {
    install.packages(libs[!installed_libraries])
}

invisible(
    lapply(libs, library, character.only = T)
)

# Country Boarders (data from Sentinel-2)
country_sf <- giscoR::gisco_get_countries(
    country = "CH",
    resolution = "1"
)

## Land Cover Sentinel 2 - Switzerland
urls <- c("https://lulctimeseries.blob.core.windows.net/lulctimeseriesv003/lc2022/32T_20220101-20230101.tif",
"https://lulctimeseries.blob.core.windows.net/lulctimeseriesv003/lc2022/31T_20220101-20230101.tif")

for (url in urls) {
    download.file(
        url = url,
        destfile = basename(url),
        mode = "wb"
    )
}

## Load tiles

list.files(
    path = getwd(),
    pattern = "tif",
    full.names = T
)

