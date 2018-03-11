# Data preparation

# libraries
library(tidyverse)
library(readxl)

# load data
formulari_raw <- read_xlsx('Formulari_textos_ok.xlsx')

# locate coordinates
coords_data <- data_frame(
  index = 1,
  "Localització" = "Collserola",
  lat = 41.407331704,
  long =  2.070999716
)

coords_data <- rbind(coords_data, c(2, "Lamanère", 42.36085, 2.51919))

coords_data <- rbind(coords_data, c(3, "L'obaga d'Arrós", 41.67472, 1.84353))

coords_data <- rbind(coords_data, c(4, "Monistrol de Calders", 41.75984, 2.01446))

coords_data <- rbind(coords_data, c(5, "Serra de Tramuntana, Mallorca", 39.58372, 2.49999))

coords_data <- rbind(coords_data, c(6, "Serra de Tramuntana, Mallorca", 39.58372, 2.49999))

coords_data <- rbind(coords_data, c(7, "Serra de Pàndols", 41.02833, 0.45917))

coords_data <- rbind(coords_data, c(8, "Yamino, Pucallpa, Peru", -8.92856, -75.63863))

coords_data <- rbind(coords_data, c(9, "Vall del Llobregós (Sanauja, la Segarra)", 41.71318, 1.32764))

coords_data <- rbind(coords_data, c(10,"Galicia", 42.5751, -8.1339))

coords_data <- rbind(coords_data, c(11, "Zermatt (Suïssa)", 46.02071, 7.74912))

coords_data <- rbind(coords_data, c(12, "Guiana Francesa. Sur America", 5.04285, -52.78842))

coords_data <- rbind(coords_data, c(13,"El Montseny", 41.78558, 2.39124))

coords_data <- rbind(coords_data, c(14,"Caldes de Mallavella", 41.83580, 2.80786))

coords_data <- rbind(coords_data, c(15,"Coca", 41.21580, -4.52206))

coords_data <- rbind(coords_data, c(16,"PNIN Pinya de Rosa (Blanes)", 41.69222, 2.78296))

coords_data <- rbind(coords_data, c(17,"Riudarenes", 41.81925, 2.66857))

coords_data <- rbind(coords_data, c(18,"El Montseny", 41.78558, 2.39124))

coords_data <- rbind(coords_data, c(19,"El Montseny", 41.78558, 2.39124))

coords_data <- rbind(coords_data, c(20,"Casserres", 42.01428, 1.82208))

coords_data <- rbind(coords_data, c(21,"St. Hilari Sacalm, les Guilleries", 41.88073, 2.50520))

coords_data <- rbind(coords_data, c(22,"La Com i la Pedra, Fonts del Cardener", 42.182401, 1.585635))

coords_data <- rbind(coords_data, c(23,"Sta. Fe. Montseny", 41.78558, 2.39124))

coords_data <- rbind(coords_data, c(24,"Olivella, el Garraf", 41.31009, 1.81238))

coords_data <- rbind(coords_data, c(25,"Manaus, Brazil", -3.11903, -60.02173))

coords_data <- rbind(coords_data, c(26,"Espai Natural Protegit del Collsacabra", 42.074496, 2.419754))

coords_data <- rbind(coords_data, c(27,"Los Ancares Galicia", 42.88293, -7.00684))

coords_data <- rbind(coords_data, c(28,"Guadarrama (Madrid)", 40.85090, -3.94997))

coords_data <- rbind(coords_data, c(29,"Parc de la Serralada de Marina", 41.490213, 2.251537))

coords_data <- rbind(coords_data, c(30,"Cabezón de la Sal (Cantabria)", 43.30908, -4.23766))

coords_data <- rbind(coords_data, c(31,"Luce County, Michigan, USA", 46.58275, -85.51333))

coords_data <- rbind(coords_data, c(32,"Harrietville-Australia", -36.88867, 147.06504))

coords_data <- rbind(coords_data, c(33,"Alta Ribagorça", 42.50900, 0.79132))

coords_data <- rbind(coords_data, c(34,"Paraguay, cerca del lago blanco", -23.44250, -58.44383))

coords_data <- rbind(coords_data, c(35,"Rurrenabaque, Bolivia", -14.42961, -67.53509))

coords_data <- rbind(coords_data, c(36,"Sagunt, Spain", 39.67986, -0.27844))

coords_data <- rbind(coords_data, c(37,"Moralzarzal, Comunidad de Madrid", 40.67635, -3.97049))

coords_data <- rbind(coords_data, c(38,"Rinconada, Sierra de las Quilamas", 39.83909, -4.41371))

coords_data <- rbind(coords_data, c(39,"Tirimbina (Costa Rica)", 10.39777, -84.11778))

coords_data <- rbind(coords_data, c(40,"Bosc de Garrofers, Sant Pol de Mar", 41.60649, 2.61397))

coords_data <- rbind(coords_data, c(41,"Olesa de Montserrat, Barcelona", 41.54517, 1.89134))

coords_data <- rbind(coords_data, c(42,"Viladecavalls", 41.55461, 1.95880))

coords_data <- rbind(coords_data, c(43,"Parque Nacional Natural de Chingaza, Colombia", 4.578853, -73.755066))

coords_data <- rbind(coords_data, c(44,"Picos de Europa", 43.18722, -4.82152))

coords_data <- rbind(coords_data, c(45,"Sant Hilar Sacalm, Les Guilleries", 41.90223, 2.50989))

coords_data <- rbind(coords_data, c(46,"Marmellar", 41.35057, 1.53580))

coords_data <- rbind(coords_data, c(47,"Vall del Relat, Avinyó", 41.86418, 1.97241))

coords_data <- rbind(coords_data, c(48,"L’Ametlla de Segarrau", 41.57549, 1.24008))

coords_data <- rbind(coords_data, c(49,"El Gresolet (Pedraforca)", 42.23889, 1.70639))

coords_data <- rbind(coords_data, c(50,"El Montseny", 41.78558, 2.39124))

coords_data <- rbind(coords_data, c(51,"Sant Julià d'Altura, Sabadell", 41.583146, 2.068137))

coords_data <- rbind(coords_data, c(52,"Redes (Caso, Asturias)", 43.16589, -5.35209))

coords_data <- rbind(coords_data, c(53,"Binsar Forest (Uttarakhand, India)", 30.06675, 79.01930))

coords_data <- rbind(coords_data, c(54,"Mar del Plata, Argentina.", -38.00548, -57.54261))

coords_data <- rbind(coords_data, c(55,"Caldes de Boí, La Vall de Boí", 42.56274, 0.84175))

coords_data <- rbind(coords_data, c(56,"Can Déu, Sabadell", 41.57595, 2.08654))

coords_data <- rbind(coords_data, c(57,"Moratalla, Murcia", 38.17117, -2.10575))

coords_data <- rbind(coords_data, c(58,"Bosc del Malhivern, La Garriga, Falda del Montseny", 41.69335, 2.27781))

coords_data <- rbind(coords_data, c(59,"Bosc del Malhivern, La Garriga, Falda del Montseny", 41.69335, 2.27781))

coords_data <- rbind(coords_data, c(60,"Viladrau (o bé Vilarmau o bé castanyer de les 9 branques)", 41.84781, 2.39042))

coords_data <- rbind(coords_data, c(61,"Pallars Sobirà", 42.46686, 1.13530))

coords_data <- rbind(coords_data, c(62,"Komovi mts., Montenegro", 42.68028, 19.64889))

coords_data <- rbind(coords_data, c(63,"Dworp, Belgie", 50.72949, 4.30109))

coords_data <- rbind(coords_data, c(64,"Ternat, Belgium", 50.87009, 4.17833))

coords_data <- rbind(coords_data, c(65,"Tapada Real, Vila Viçosa, Portugal", 38.77542, -7.41612))

coords_data <- rbind(coords_data, c(66,"Ermita de Sant Ponç a Corbera d Sant Ponç", 41.40707, 1.90947))

coords_data <- rbind(coords_data, c(67,"California, USA", 36.7783, -119.4179))

coords_data %>%
  mutate(lat = as.numeric(lat),
         long = as.numeric(long),
         index = as.numeric(index)) -> coords_data

formulari_raw %>%
  mutate(index = as.numeric(rownames(.)),
         recurso = case_when(is.na(recurso) ~ "text",
                             TRUE ~ recurso)) %>%
  left_join(coords_data, by = 'index') %>%
  dplyr::select(Localització, lat, long, everything()) -> data_map

save(data_map, file = 'data_map.RData')
