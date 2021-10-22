# -*- coding: utf-8 -*-
"""
Created on Mon Mar  8 17:58:49 2021

@author: Owner
"""


import arcpy

arcpy.env.workspace = r"C:\Users\Owner\Documents\UNC_SPRING2021\Adv_GIS"

arcpy.KMLToLayer_conversion('RIBITS_BANKS_ILF_KML.kml', r'C:\Users\Owner\Documents\UNC_SPRING2021\Adv_GIS', 'ribits')

