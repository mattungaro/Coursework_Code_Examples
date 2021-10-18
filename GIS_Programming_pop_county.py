

import arcpy

arcpy.env.workspace = "C:/Users/Owner/Documents/FALL2020/GIS Programming/programming_project"

arcpy.env.overwriteOutput = True

arcpy.Select_analysis("counties.shp", "C:/Users/Owner/Documents/FALL2020/GIS Programming/programming_project/counties_selected.shp", '"estimate" >= 100000')

# This successfully created a new file that had only counties that have a population greater than 100,000 residents
# counties.shp was previously created in R through the use of tidycensus
