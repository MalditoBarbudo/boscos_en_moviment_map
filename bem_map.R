library(tidyverse)
library(leaflet)
library(htmltools)
library(mapview)

load('data_map.RData')

data_map_video <- data_map %>%
  dplyr::filter(recurso == 'video') %>%
  mutate(arxivo = c('KUZ7JrLQjTs', 'QU1JYEPH_qE', '__1E9j3A5vw',
                    'fW8igd0gEu0', '-EdWdWt4124', 'NCZiN9OM9fk', '-3on7Soy-wg',
                    'ikF9ItIj-Xs', '3NBX8zVWaTs'),
         link = paste0('https://www.youtube.com/embed/',arxivo,'?autoplay=1'))

for (i in 1:length(data_map_video$link)) {
  data_map_video$link[i] <- mapview:::popupIframe(data_map_video$link[i])
}

# silvia ferrer foto
data_map[66, 'arxivo'] <- 'IMG_20180123_150141 - Sílvia Ferrer.jpg'

data_map_foto <- data_map %>%
  dplyr::filter(recurso == 'imagen') %>%
  dplyr::mutate(arxivo = stringr::str_replace(arxivo, '.JPG', '.jpg'),
                arxivo = stringr::str_replace(arxivo, '\n', ''),
                arxivo = stringr::str_replace(arxivo, "'", "_"),
                link = file.path('Photo', arxivo)) %>%
  dplyr::slice(-2)


data_map_text <- data_map %>%
  dplyr::filter(recurso == 'text')

map_video <- data_map_video %>%
  leaflet(options = leafletOptions(worldCopyJump = TRUE, scales = 100)) %>%
  addProviderTiles(
    provider = 'Stamen.Watercolor'
  ) %>%
  addCircleMarkers(~long, ~lat, popup = ~link,
                   color = 'red',
                   fillOpacity = 0.65, stroke = FALSE, radius = 12) %>%
  addEasyButton(easyButton(
    icon="fa-globe", title="Zoom to Level 1",
    onClick=JS("function(btn, map){ map.setZoom(1); }")
  ))

map_foto <- data_map_foto %>%
  leaflet(options = leafletOptions(worldCopyJump = TRUE, scales = 100)) %>%
  addProviderTiles(
    provider = 'Stamen.Watercolor'
  ) %>%
  addCircleMarkers(~long, ~lat, popup = ~mapview::popupImage(link),
                   color = 'green',
                   fillOpacity = 0.65, stroke = FALSE, radius = 12) %>%
  addEasyButton(easyButton(
    icon="fa-globe", title="Zoom to Level 1",
    onClick=JS("function(btn, map){ map.setZoom(1); }")
  ))

map_text <- data_map_text %>%
  leaflet(options = leafletOptions(worldCopyJump = TRUE, scales = 100)) %>%
  addProviderTiles(
    provider = 'Stamen.Watercolor'
  ) %>%
  addCircleMarkers(~long, ~lat, popup = ~Texto_OK,
                   color = 'blue',
                   fillOpacity = 0.65, stroke = FALSE, radius = 12) %>%
  addEasyButton(easyButton(
    icon="fa-globe", title="Zoom to Level 1",
    onClick=JS("function(btn, map){ map.setZoom(1); }")
  ))

global_map <- data_map_video %>%
  leaflet(options = leafletOptions(worldCopyJump = TRUE, scales = 100)) %>%
  addProviderTiles(
    provider = 'Stamen.Watercolor'
  ) %>%
  addCircleMarkers(~long, ~lat, popup = ~link,
                   color = 'red', label = ~htmlEscape(paste(NOMBRE, BOSC, sep = '\n')),
                   fillOpacity = 0.65, stroke = FALSE, radius = 12) %>%
  addCircleMarkers(data = data_map_foto,
                   ~long, ~lat, popup = ~mapview::popupImage(link),
                   color = 'green', label = ~htmlEscape(paste(NOMBRE, BOSC, sep = '\n')),
                   fillOpacity = 0.65, stroke = FALSE, radius = 12) %>%
  addCircleMarkers(data = data_map_text,
                   ~long, ~lat, popup = ~Texto_OK,
                   color = 'blue', label = ~htmlEscape(paste(NOMBRE, BOSC, sep = '\n')),
                   fillOpacity = 0.65, stroke = FALSE, radius = 12) %>%
  addEasyButton(easyButton(
    icon="fa-globe", title="Zoom to Level 1",
    onClick=JS("function(btn, map){ map.setZoom(1); }")
  ))

global_map
