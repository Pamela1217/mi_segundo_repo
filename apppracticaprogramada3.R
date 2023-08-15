library(shiny)


ui <- fluidPage(
  titlePanel(h4(strong("Planificador de eventos"))),
  sidebarLayout(
    sidebarPanel(widht=6,
                 
                 textInput(inputId = "nombre_evento", 
                           label = "Nombre del evento",
                           placeholder = "Boda de María y Julio"
                 ),
                 tags$hr(style="border-color:orange;"),
                 
                 selectInput(inputId = "selector_provincia", # el id de este "input", debe ser único
                             label = "Seleccione la provincia en la que vive:", 
                             choices = c("San José", "Alajuela","Cartago", "Heredia","Guanacaste","Puntarenas","Limón"),
                             multiple = FALSE
                 ),
                 tags$hr(style="border-color:orange;"),
                 
                 numericInput(inputId = "numero_edad", 
                              label = "Ingrese su edad", 
                              value = 18, #indica el valor inicial a mostrar
                              min = 15, #permite indicar el valor mínimo
                              max = 105, #permite indicar el valor máximo
                              step = 1, #permite indicar el incremento entre números
                 ),
                 tags$hr(style="border-color:orange;")
                 
    ),
    mainPanel(widht=6,
              textOutput("Informacion_Personal"),
              br(),
              br(),
              div(img(src = "Imagensesion12.png", height=140,widht=600), aling="center")
    ),
    
  ),
  
)

server <- function(input, output, session) {
  
  output$Informacion_Personal <- renderText(paste0("Le damos la bienvenida ",input$nombre_persona," !
                                                   Usted ha seleccionado ",input$selector_provincia,
                                                   " como su ubicación en Costa Rica y su edad es de ",
                                                   input$numero_edad," años." ))
  
}

shinyApp(ui, server)