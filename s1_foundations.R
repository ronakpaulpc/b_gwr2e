# Practice code of "Geocomputation with R" 2nd edition by Robin Lovelace & co.
# In this directory we have code in script files from each book section.
# Then in each script we have code sections for each book chapter.
# This script contains code from "Foundations" section of the book.

# Happy learning!


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# C0 - Installing and loading ---------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Working directory check
getwd()

# We install the required packages
install.packages(c(
    "sf",               # classes and functions for vector data
    "terra",            # classes and functions for raster data
    "spData"            # loading geographic data
))

# Custom installing package for loading larger geographic data
install.packages("spDataLarge", repos = "https://nowosad.r-universe.dev")

# Random code
# pacman::p_load(sf,                  # package for spatial vector data
#                terra,               # package for spatial raster data
#                spData,              # load geographic data
#                spDataLarge,         # load larger geographic data
#                sp                   # old package for sf
#                )


#_====
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# C2 - Geographic data in R -----------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Prerequisites
# Loading the required packages for this chapter.
library(easypackages)
libraries(
    "sf",
    "terra",
    "spData",
    "spDataLarge"
)


# C2.1 Introduction -------------------------------------------------------
# NO CODE.


# C2.2 Vector data --------------------------------------------------------







# 2.2.1 An introduction to simple features
# Reading vignettes for the sf package
vignette(package = "sf")
vignette("sf1")

class(world)                # checking object type of 'world'
names(world)                # checking variables in object 'world'
plot(world)                 # plotting maps of each column in the world sf data.frame

View(world)                 # data check
summary(world)              # summary of the 'world' sf data frame
summary(world["lifeExp"])   # overview of the lifeExp variable

# creating subset of world data frame
world_mini = world[1:2, 1:3]
world_mini


# 2.2.2 Why simple features?
# demo of read_sf() function
world_dfr <- st_read(system.file("shapes/world.shp", package = "spData"))
world_tbl <- read_sf(system.file("shapes/world.shp", package = "spData"))
class(world_dfr)
class(world_tbl)

# Converting sf and sp objects
# from an sf object to sp object
world_sp <- as(world, "Spatial")
# from sp to sf object
world_sf <- st_as_sf(world_sp)


# 2.2.3 Basic map making
plot(world[3:6])
plot(world["pop"])

# Another plotting demo
# filter countries in Asia and combine them into a single feature
world_asia <- world[world$continent == "Asia", ]
asia <- st_union(world_asia)
# plotting the Asian continent over the world map
plot(world["pop"], reset = FALSE)
plot(asia, add = TRUE, col = "red")

# Another map with plot()
plot(world["continent"], reset = F)
cex = sqrt(world$pop) / 10000
world_cents <- st_centroid(world, of_largest = TRUE)
plot(st_geometry(world_cents), add = TRUE, cex = cex)

# India in context, demonstrating the expandBB argument
india <- world[world$name_long == "India", ]
plot(st_geometry(india), expandBB = c(0, 0.2, 0.1, 1), col = "gray", lwd = 3)
plot(st_geometry(world_asia), add = T)


# 2.2.4 Geometry types
# NO CODES HERE




















