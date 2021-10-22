# -*- coding: utf-8 -*-
"""
Created on Thu Oct 22 18:41:01 2020

@author: Owner
"""


import arcpy
arcpy.env.workspace = r"C:\Users\Owner\Documents\UNC_SPRING2021\Adv_GIS\demographics"

arcpy.env.overwriteOutput = True

arcpy.Buffer_analysis("everything.shp", "buffered_everything.shp", "1 Mile", "FULL", 
                      "ROUND")


