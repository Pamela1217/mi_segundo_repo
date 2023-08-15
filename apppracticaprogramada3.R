library(shiny)


ui <- fluidPage(
  titlePanel(h4(strong("Planificador de eventos"))),
  sidebarLayout(
    sidebarPanel(widht=6,
        textInput(inputId = "nombre_evento", 
                  label = "Nombre del evento",
                  placeholder = "Boda de María y Julio"
                 ),
        
        selectInput(inputId = "tema_evento", # el id de este "input", debe ser único
                    label = "Tema del evento", 
                    choices = c("Fiesta de cumpleaños","Boda","Conferencia", "Otro"),
                    multiple = FALSE
        ),
        
        numericInput(inputId = "numero_invitados", 
                     label = "Número de invitados", 
                     value = 58, #indica el valor inicial a mostrar
                     min = 25, #permite indicar el valor mínimo
                     max = 120, #permite indicar el valor máximo
                     step = 1, #permite indicar el incremento entre números
        ),
        
        selectInput(inputId = "selector_provincia", # el id de este "input", debe ser único
                    label = "Provincia", 
                    choices = c("San José", "Alajuela","Cartago", "Heredia","Guanacaste","Puntarenas","Limón"),
                    multiple = FALSE
        ),
         
  
                ),
    
        
    mainPanel(
      h2("Vamos a planificar su día especial",style="color:blue",align="center"),
      tags$hr(style="border-color:blue;"),
      h4("Detalles del evento:"),
      textOutput("detalles_evento1"),
      hr(),
      textOutput("detalles_evento2"),
      hr(),
      textOutput("detalles_evento3")
      
    )
                 
    )
  )


server <- function(input, output, session) {
  output$detalles_evento1 <- renderText(paste0("Nombre del evento: ",input$nombre_evento))
  output$detalles_evento2 <- renderText(paste0("Tema del evento: ",input$tema_evento))
  output$detalles_evento3 <- renderText(paste0("Número de invitados y ubicación: El evento ",input$tema_evento," tendrá ",input$numero_invitados, " y será llevada a cabo en ",input$selector_provincia))
}

shinyApp(ui, server)