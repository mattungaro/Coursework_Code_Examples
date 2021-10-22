# -*- coding: utf-8 -*-
"""
Created on Sat Nov 14 13:14:15 2020

@author: Owner
"""
# CLEANING AND ALTERING DATA FOR GIS PROGRAMMING PROJECT 
# The goal is to create datasets for each demographic and visualize.
import pandas as pd

x = r"C:\Users\Owner\Documents\FALL2020\GIS Programming\programming_project\all_data.csv"

df = pd.read_csv(x)

pd.set_option("display.max.columns", None)

df.head()

df2 = df.sort_values(by = 'all', ascending = False)

df3= df2.iloc[0:50, ]

df3['percent_white'] = df3['percent_white'].astype(float)
df3['percent_am_indian'] = df3['percent_am_indian'].astype(float)
df3['percent_asian'] = df3['percent_asian'].astype(float)
df3['percent_black'] = df3['percent_black'].astype(float)
df3['percent_hispanic'] = df3['percent_hispanic'].astype(float)
df3['percent_not_impaired'] = df3['percent_not_impaired'].astype(float)
df3['percent_impaired'] = df3['percent_impaired'].astype(float)

df3.plot.scatter(x =  "percent_white", y = "percent_not_impaired")

df3.plot.scatter(x =  "percent_black", y = "percent_not_impaired")

df3.plot.scatter(x =  "percent_hispanic", y = "percent_not_impaired")
df3.plot.scatter(x =  "median_income", y = "percent_not_impaired")

df4= df2.iloc[0:100, ]

df4.plot.scatter(x =  "percent_white", y = "percent_not_impaired")

df4.plot.scatter(x =  "percent_black", y = "percent_not_impaired")

df4.plot.scatter(x =  "percent_hispanic", y = "percent_not_impaired")
df4.plot.scatter(x =  "median_income", y = "percent_not_impaired")

df4.to_csv(path_or_buf = r"C:\Users\Owner\Documents\FALL2020\GIS Programming\programming_project\df4.csv", index=False)

# will run linear regression in R

df5 = df2.iloc[0:1000, ]
df6 = df2.iloc[3170:4170, ]
df5.to_csv(path_or_buf = r"C:\Users\Owner\Documents\FALL2020\GIS Programming\programming_project\df5.csv", index=False)
df6.to_csv(path_or_buf = r"C:\Users\Owner\Documents\FALL2020\GIS Programming\programming_project\df6.csv", index=False)



# top 100 white
df_white = df.sort_values(by = 'percent_white', ascending = False)
df_white = df_white.query('percent_impaired != 1 & percent_impaired != 0')
df_white = df_white.iloc[0:100, ]
df_white.plot.scatter(x = "percent_white", y = "percent_impaired")
df_white.to_csv(path_or_buf = r"C:\Users\Owner\Documents\FALL2020\GIS Programming\programming_project\top_100\df_white.csv",
                index = False)
# top 100 black
df_black = df.sort_values(by = 'percent_black', ascending = False)
df_black = df_black.query('percent_impaired != 1 & percent_impaired != 0')
df_black = df_black.iloc[0:100, ]
df_black.plot.scatter(x = "percent_black", y = "percent_impaired")
df_black.to_csv(path_or_buf = r"C:\Users\Owner\Documents\FALL2020\GIS Programming\programming_project\top_100\df_black.csv",
                index = False)
# top 100 hispanic
df_hispanic = df.sort_values(by = 'percent_hispanic', ascending = False)
df_hispanic = df_hispanic.query('percent_impaired != 1 & percent_impaired != 0')
df_hispanic = df_hispanic.iloc[0:100, ]
df_hispanic.plot.scatter(x = "percent_hispanic", y = "percent_impaired")
df_hispanic.to_csv(path_or_buf = r"C:\Users\Owner\Documents\FALL2020\GIS Programming\programming_project\top_100\df_hispanic.csv",
                index = False)
# top 100 median income
df_median = df.sort_values(by = 'median_income', ascending = False)
df_median = df_median.query('percent_impaired != 1 & percent_impaired != 0')
df_median = df_median.iloc[0:1000, ]
df_median.plot.scatter(x = "median_income", y = "percent_impaired", figsize=(12,8))
df_median.to_csv(path_or_buf = r"C:\Users\Owner\Documents\FALL2020\GIS Programming\programming_project\top_100\df_median.csv",
                index = False)

df.plot.scatter(x = "median_income", y = "percent_not_impaired", figsize=(12,8), )
