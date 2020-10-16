library(shiny)

shinyUI(
    navbarPage("Shiny Application",
               tabPanel("Analysis",
                        fluidPage(
                            titlePanel("The relationship between variables and plant species"),
                            sidebarLayout(
                                sidebarPanel(
                                    selectInput("variable", "Variable:",
                                                c("Sepal length" = "Sepal.Length",
                                                  "Sepal width" = "Sepal.Width",
                                                  "Petal length" = "Petal.Length",
                                                  "Petal width" = "Petal.Width"
                                                )),
                                    
                                    checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                                ),
                                
                                mainPanel(
                                    h3(textOutput("caption")),
                                    
                                    tabsetPanel(type = "tabs", 
                                                tabPanel("BoxPlot", plotOutput("irisBoxPlot")),
                                                tabPanel("Classification Tree", 
                                                         plotOutput("irisCT"),
                                                         verbatimTextOutput("fit")
                                                )
                                    )
                                )
                            )
                        )
               ),
               tabPanel("About the Data Set",
                        
                        h3("Regression Models Course Project (from Coursera)"),
                        helpText("This famous (Fisher's or Anderson's) iris data set gives the measurements 
                                 in centimeters of the variables sepal length and width and petal length and width, 
                                 respectively, for 50 flowers from each of 3 species of iris. The species are Iris setosa, 
                                 versicolor, and virginica."),
                        h3("Important"),
                        p("A data frame with 32 observations on 11 variables."),
                        
                        a("https://class.coursera.org/regmods-008")
               ),
               tabPanel("More Data Detail",
                        h2("Iris data set"),
                        hr(),
                        h3("Description"),
                        helpText("iris is a data frame with 150 cases (rows) and 5 
                                 variables (columns) named Sepal.Length, Sepal.Width, 
                                 Petal.Length, Petal.Width, and Species."),
                        h3("Format"),
                        p("A data frame with 150 observations on 5 variables."),
                        
                        p("  [, 1]   Sepal length"),
                        p("  [, 2]	 Sepal width"),
                        p("  [, 3]	 Petal length"),
                        p("  [, 4]	 Petal width"),
                        p("  [, 5]	 Species"),
                        
                        h3("Source"),
                        
                        p("Fisher, R. A. (1936) The use of multiple measurements in taxonomic problems. Annals of Eugenics, 7, Part II, 179-188.")
               ),
               tabPanel("Go back to my Github repository",
                        a(""),
                        hr(),
                        h4("I hope you like the Shiny App"),
               )
    )
)