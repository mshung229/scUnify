# from scanpy palette
godsnot_102 <- c(
    "#000000", "#FFFF00", "#1CE6FF", "#FF34FF", "#FF4A46", "#008941", "#006FA6", "#A30059", "#FFDBE5", "#7A4900", "#0000A6", "#63FFAC", 
    "#B79762", "#004D43", "#8FB0FF", "#997D87", "#5A0007", "#809693", "#6A3A4C", "#1B4400", "#4FC601", "#3B5DFF", "#4A3B53", "#FF2F80", 
    "#61615A", "#BA0900", "#6B7900", "#00C2A0", "#FFAA92", "#FF90C9", "#B903AA", "#D16100", "#DDEFFF", "#000035", "#7B4F4B", "#A1C299", 
    "#300018", "#0AA6D8", "#013349", "#00846F", "#372101", "#FFB500", "#C2FFED", "#A079BF", "#CC0744", "#C0B9B2", "#C2FF99", "#001E09", 
    "#00489C", "#6F0062", "#0CBD66", "#EEC3FF", "#456D75", "#B77B68", "#7A87A1", "#788D66", "#885578", "#FAD09F", "#FF8A9A", "#D157A0", 
    "#BEC459", "#456648", "#0086ED", "#886F4C", "#34362D", "#B4A8BD", "#00A6AA", "#452C2C", "#636375", "#A3C8C9", "#FF913F", "#938A81", 
    "#575329", "#00FECF", "#B05B6F", "#8CD0FF", "#3B9700", "#04F757", "#C8A1A1", "#1E6E00", "#7900D7", "#A77500", "#6367A9", "#A05837", 
    "#6B002C", "#772600", "#D790FF", "#9B9700", "#549E79", "#FFF69F", "#201625", "#72418F", "#BC23FF", "#99ADC0", "#3A2465", "#922329", 
    "#5B4534", "#FDE8DC", "#404E55", "#0089A3", "#CB7E98", "#A4E804", "#324E72")
zeileis_28 <- c(
    "#023fa5", "#7d87b9", "#bec1d4", "#d6bcc0", "#bb7784", "#8e063b", "#4a6fe3", "#8595e1", "#b5bbe3", "#e6afb9", "#e07b91", "#d33f6a", 
    "#11c638", "#8dd593", "#c6dec7", "#ead3c6", "#f0b98d", "#ef9708", "#0fcfc0", "#9cded6", "#d5eae7", "#f3e1eb", "#f6c4e1", "#f79cd4", 
    "#7f7f7f", "#c7c7c7", "#1CE6FF", "#336600")

# from wesanderson
royal_4 <- wesanderson::wes_palette("Royal1") 
asteroid_5 <- wesanderson::wes_palette("AsteroidCity3")
darjeeling_5 <- wesanderson::wes_palette("Darjeeling2")
zissou_5 <- wesanderson::wes_palette("Zissou1")

# from https://david-barnett.github.io/microViz/
kelly_20 <- c(
    "#f3c300", "#875692", "#f38400", "#a1caf1", "#be0032", "#c2b280",
    "#848482", "#008856", "#e68fac", "#0067a5", "#f99379", "#604e97",
    "#f6a600", "#b3446c", "#dcd300", "#882d17", "#8db600", "#654522",
    "#e25822", "#2b3d26")
greenarmytage_25 <- c(
    "#F0A3FF", "#0075DC", "#993F00", "#4C005C", 
    "#005C31", "#2BCE48", "#FFCC99", "#808080", "#94FFB5", "#8F7C00",
    "#9DCC00", "#C20088", "#003380", "#19A405", "#FFA8BB", "#426600",
    "#FF0010", "#5EF1F2", "#00998F", "#E0FF66", "#100AFF", "#990000",
    "#FFFF80", "#FFE100", "#FF5000")
brewerplus_41 <- c(
    "#A6CEE3", "#1F78B4", "#B2DF8A", "#33A02C", "#FB9A99", "#E31A1C",
    "#FDBF6F", "#FF7F00", "#CAB2D6", "#6A3D9A", "#FFFF99", "#B15928",
    "#1ff8ff", "#1B9E77", "#D95F02", "#7570B3", "#E7298A", "#66A61E", 
    "#E6AB02", "#A6761D", "#666666", "#4b6a53", "#b249d5", "#7edc45",
    "#5c47b8", "#cfd251", "#ff69b4", "#69c86c", "#cd3e50", "#83d5af", 
    "#da6130", "#5e79b2", "#c29545", "#532a5a", "#5f7b35", "#c497cf", 
    "#773a27", "#7cb9cb", "#594e50", "#d3c4a8", "#c17e7f")

# more colors at https://r-charts.com/color-palettes/
calc_11 <- c("#004586", "#FF420E", "#FFD320", "#579D1C", "#7E0021", "#83CAFF", "#314004", "#AECF00", "#4B1F6F", "C5000B", "#0084D1")
piyg_11 <- c("#8E0152", "#C51B7D", "#DE77AE", "#F1B6DA", "#FDE0EF", "#F7F7F7", "#E6F5D0", "#B8E186", "#7FBC41", "#4D9221", "#276419")
brbg_11 <- c("#543005", "#8C510A", "#BF812D", "#DFC27D", "#F6E8C3", "#F5F5F5", "#C7EAE5", "#80CDC1", "#35978F", "#01665E", "#003C30")
prgn_11 <- c("#40004B", "#762A83", "#9970AB", "#C2A5CF", "#E7D4E8", "#F7F7F7", "#D9F0D3", "#A6DBA0", "#5AAE61", "#1B7837", "#00441B")


palette_list <- mget(c(
    "godsnot_102", "zeileis_28", "royal_4", "asteroid_5", 
    "darjeeling_5", "zissou_5", "kelly_20", "greenarmytage_25", "brewerplus_41"))
#' palette_list
#'
#' palette_list
#' @export
"palette_list"