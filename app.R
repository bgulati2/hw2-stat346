#find your perfect recipe (shiny app)!
#bani gulati
#stat 436 - hw 2
#i hope u r able to find ur fav recipe from AllRecipes cuisine data...
#...by filtering from country/calories/name :P 

library(arrow)
library(tidytext)
library(tidyverse)
library(shiny)
library(lubridate)


all_recipes <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-09-16/all_recipes.csv")
cuisines <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-09-16/cuisines.csv")
View(all_recipes)
View(cuisines)

cuisines <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-09-16/cuisines.csv") %>%
  mutate(
    calories = as.numeric(calories),
    avg_rating = as.numeric(avg_rating),
    prep_time = as.numeric(prep_time),
    cook_time = as.numeric(cook_time),
    country = fct_explicit_na(country),
    name = as.character(name)
  )

#coutries is a clean vector of country names (for dropdown)
countries <- pull(cuisines, country) %>%
  unique() %>%
  na.omit()

### definition of app
ui <- fluidPage(
  titlePanel("find your perfect receipe"),
  selectInput("country", "country", countries, selected = countries[1], multiple = TRUE),
  sliderInput("calories", "calories", 
              min = min(cuisines$calories, na.rm = TRUE), 
              max = max(cuisines$calories, na.rm = TRUE),
              value = c(
                min(cuisines$calories, na.rm = TRUE),
                max(cuisines$calories, na.rm = TRUE)
              )),
  textInput("search", "search recipe name"),
  tableOutput("table")
)

server <- function(input, output, session) {
  cuisines_filter <- reactive({
    cuisines |>
      filter(
        country %in% input$country,
        calories >= input$calories[1],
        calories <= input$calories[2],
        if (input$search == "") TRUE
        else str_detect(tolower(name), tolower(input$search))
      )
  })
  output$summary <- renderPrint({
    summary(cuisines_filter() |> select(name, country, url, calories))
  })
  output$table <- renderTable({
    cuisines_filter() |>
      select(name, country, url, calories)
  })
}

app <- shinyApp(ui, server)
