# -*- coding: utf-8 -*-
"""
Created on Sat Nov 14 10:21:52 2020

@author: Owner
"""


import arcpy

arcpy.env.workspace = r"C:\Users\Owner\Documents\UNC_SPRING2021\Adv_GIS\demographics\2012_NC_Integrated_Report_Assessment_by_Parameter-shp"

arcpy.env.overwriteOutput = True

buff = "buffered_block_groups.shp"
impaired =r"C:\Users\Owner\Documents\UNC_SPRING2021\Adv_GIS\demographics\2012_NC_Integrated_Report_Assessment_by_Parameter-shp\impaired_streams.shp"
unimpaired =r"C:\Users\Owner\Documents\UNC_SPRING2021\Adv_GIS\demographics\2012_NC_Integrated_Report_Assessment_by_Parameter-shp\unimpaired_streams.shp"


arcpy.Clip_analysis(impaired, buff, "clipped_impaired_polylines_block_group.shp")
arcpy.Clip_analysis(unimpaired, buff, "clipped_unimpaired_polylines_block_group.shp")


