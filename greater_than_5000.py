
# Limited the census areas to areas with more than 5000 residents.

import arcpy

arcpy.env.workspace = r"C:\Users\Owner\Documents\UNC_SPRING2021\Adv_GIS\demographics"

arcpy.env.overwriteOutput = True

arcpy.Select_analysis("buffered_everything.shp", "buffered_everything_5000.shp", '"estimat" >= 5000')

# This successfully created a new file that had only has census areas that have a population greater than 5,000 residents
