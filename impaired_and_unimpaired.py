# -*- coding: utf-8 -*-
"""
Created on Tue Mar  9 08:18:46 2021

@author: Owner
"""
# split NC DEQ report of impaired and supporting streams into new datasets - one for impaired and one for unimpaired streams.

import arcpy

arcpy.env.workspace = r"C:\Users\Owner\Documents\UNC_SPRING2021\Adv_GIS\demographics\2012_NC_Integrated_Report_Assessment_by_Parameter-shp"

arcpy.env.overwriteOutput = True

arcpy.Select_analysis("2012_NC_Integrated_Report_Assessment_by_Parameter.shp", "impaired_streams.shp", '"USR_Long" = \'Impaired\'')
arcpy.Select_analysis("2012_NC_Integrated_Report_Assessment_by_Parameter.shp", "unimpaired_streams.shp", '"USR_Long" = \'Supporting\'')

# This successfully created two new impaired and unimpaired files.
