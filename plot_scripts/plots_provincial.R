library(tidyverse)
library(cowplot)
library(glue)
library(lubridate)
dir.create("plots")
pdf(NULL)

#####################
### PROVINCE DATA ###
#####################

# load province data
data_prov <- read_csv("data/rivm_NL_covid19_province.csv")

data_prov <- read_csv(url("https://raw.githubusercontent.com/J535D165/CoronaWatchNL/master/data-geo/data-provincial/RIVM_NL_provincial.csv"))

# Positief-geteste Coronavirus besmettingen per provincie
data_prov %>%
  filter(Datum == max(Datum), !is.na(Provincienaam)) %>%
  mutate(Provincie = forcats::fct_reorder(
    Provincienaam, AantalCumulatief, .fun = sum, .desc = TRUE)) %>%
  ggplot(aes(Provincie, AantalCumulatief)) +
  geom_col() +
  theme_minimal() +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1.1)) +
  theme(axis.title.x=element_blank(),
        axis.title.y=element_blank()) +
  labs(title = "Positief-geteste Coronavirus besmettingen per provincie") +
  ggsave("plots/province_count.png", width = 6, height=4)

# Positief-geteste Coronavirus besmettingen per provincie
data_prov %>%
  filter(Type == "Totaal") %>%
  ggplot(aes(Datum, AantalCumulatief, color=Provincienaam)) +
  geom_line() +
  theme_minimal() +
  scale_x_date(date_labels = "%d-%m-%Y",
               date_breaks = "1 weeks",
               date_minor_breaks = "1 days") +
  labs(title = "Positief-geteste Coronavirus besmettingen per provincie") +
  theme(axis.title.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.x = element_text(angle = 90, hjust = 1)) +
  ggsave("plots/province_count_time.png", width = 6, height=4)


#####################
######## MAPS #######
#####################

library(sf)

# download province shapefile data
province_shp <- st_read("ext/NLD_adm/NLD_adm1.shp") %>%
  filter(ENGTYPE_1=="Province") %>%
  select(NAME_1)

plot(province_shp)

mun <- read_csv2(
  "ext/Gemeenten_alfabetisch_2019.csv")
#, 
#  col_types = cols(Gemeentecode = "i")
#)

# plot map
p_list = list()

data_map = data_prov %>%
  filter(!is.na(Provincienaam)) %>%
  complete(Datum, Provincienaam, fill = list("AantalCumulatief"=0)) %>%
  left_join(province_shp, by=c("Provincienaam"="NAME_1")) %>%
  st_as_sf() %>%
  st_set_crs(4326)

for (i in seq(0, 6)){
  print(i)
  data_subset_map = data_map %>%
    filter(Datum == max(Datum) - i*7)

  date_submap = max(data_subset_map$Datum)
  aantal_max = max(data_map$Aantal)

  p = data_subset_map %>%
    ggplot() +
    geom_sf(aes(fill=Aantal, color=Aantal, geometry = geometry)) + coord_sf( expand = FALSE) +
    theme_minimal() +
    theme(panel.grid.major = element_line(colour = "transparent"),
          axis.text.x=element_blank(),
          axis.text.y=element_blank(),
          plot.title = element_text(size = 8, hjust = 0.5)) +
    scale_colour_gradient(low = "grey", high = "#E69F00", na.value = NA, limits=c(0, aantal_max)) +
    scale_fill_gradient(low = "grey", high = "#E69F00", na.value = NA, limits=c(0, aantal_max))

  if (i == 0){
    p = p + ggtitle(date_submap)
    legend <- get_legend(
      # create some space to the left of the legend
      p + theme(legend.box.margin = margin(0, 0, 0, 12))
    )
    print(legend)
  } else if (i == 1) {
    p = p + ggtitle("-1 week")
  } else{
    p = p + ggtitle(glue("-{i} weken"))
  }

  p = p + theme(legend.position="none")

  p_list[[i+1]] = p
}

p_list[[8]] = legend

print("make grid plot")
pgrid = plot_grid(plotlist=p_list,
                  ncol=4) +
  ggsave("plots/map_province.png", width = 6, height=4)

