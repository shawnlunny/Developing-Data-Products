Developing Data Products
========================================================
author: Shawn
date: 9/16/2018
autosize: true

Data Set Choice
========================================================

Name: Women

Description: This data set gives the average heights and weights for American women aged 30-39.

Format: A data frame with 15 observations on 2 variables. Height (in) and Weight (lbs).

Details: The data set appears to have been taken from the American Society of Actuaries Build and Blood Pressure Study for some (unknown to us) earlier year.

The World Almanac notes, "The figures represent weights in ordinary indoor clothing and shoes, and heights with shoes".


```
'data.frame':	15 obs. of  2 variables:
 $ height: num  58 59 60 61 62 63 64 65 66 67 ...
 $ weight: num  115 117 120 123 126 129 132 135 139 142 ...
```

Carnival Game
========================================================

I decided to mimic a popular carnival game using the women data set.

The basic idea is that the carnival employee tries to guess your weight after asking your height. You win a prize if they guess your weight incorrectly.

Repo: http://github.com/shawnlunny/Developing-Data-Products/

Part 1 - Guessing the Weight based on Height
========================================================

The app has two panels. The sidebar panel is where the carnival employee would enter the height of the player, or use the arrows to select the correct height.

Subtle enhancements: The size of the data point and text increases or decreases with the weight.

Part 2 - Making the model more accurate
========================================================

Since the original dataset is small and uses averages, from an unknown year it may not really represent the current US population. Thus, I added a way for the carnival employee to add new data points in the well pane. Over time the dataset will move towards the average and the 'houses' odds of winning will increase.



```
Error in shinyAppDir(system.file(getwd(), package = "shiny"), options = list(width = "100%",  : 
  No Shiny application exists at the path ""
```
