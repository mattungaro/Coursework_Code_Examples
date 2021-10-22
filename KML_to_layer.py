# -*- coding: utf-8 -*-
"""
Created on Mon Mar  8 17:58:49 2021

@author: Owner
"""
# Modified my mitigation restored sites - changed them from the KML/KMZ Google Earth files to shapefiles.

import arcpy

arcpy.env.workspace = r"C:\Users\Owner\Documents\UNC_SPRING2021\Adv_GIS"

arcpy.KMLToLayer_conversion('RIBITS_BANKS_ILF_KML.kml', r'C:\Users\Owner\Documents\UNC_SPRING2021\Adv_GIS', 'ribits')

