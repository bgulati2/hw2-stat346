# hw2-stat346

find your perfect recipe (shiny app)! 

Overview & Goals:
For this project, I built a Shiny app using the TidyTuesday AllRecipes dataset. The goal of my app is to help users explore recipes by country and calorie range, and quickly find recipes that match what they’re looking for. Instead of just looking at static summaries, users can interactively filter recipes and see the results update in real time. I was interested in exploring how calorie levels vary across cuisines and whether certain countries tend to have consistently certain number of calories in their recipes

Interesting Findings:
One interesting pattern I noticed is that calorie ranges vary a lot across cuisines. Some countries have many recipes clustered at higher calorie values, while others tend to stay lower. It was also interesting to see that once I filtered by calories, some cuisines almost disappeared from the results. That wasn’t something I expected at first.

Interface Design:
I kept the interface simple and clean. The app includes: country filter (multi-select dropdown), calorie range slider, search bar for recipe names, filtered results table. These inputs allow at least two dynamic queries, since users can filter by country and calorie range (and optionally search by name)

Broader Context:
This app connects to a broader and practical problem: how people choose recipes. Instead of scrolling through a site or trying to just go on tik tok and try to find something...users can efficiently narrow options down with these filters! This project really helped me understand how to structure reactive logic in Shiny and how to design a simple but effective interactive interface

Link to Project:
https://github.com/bgulati2/hw2-stat346


