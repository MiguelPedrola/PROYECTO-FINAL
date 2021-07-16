library(shiny)
library(shinythemes)


    ui <- fluidPage(
    theme = shinytheme("cosmo"),
 
    
    titlePanel(title= h1(strong("Análisis del delito en CABA"))),
    h3(strong("Una aproximación al análisis de datos mediante el lenguaje de programación R ")),

    tabsetPanel(
        tabPanel(title = strong('Introducción del trabajo y Marco teórico')),
        tabPanel("Frecuencias del delito por fecha",
                 navlistPanel("Por favor, seleccione un año:",
                              tabPanel("2016",
                                       dygraphOutput("dygraph1"),
                                       helpText("Fuente: Datos abiertos del Ministerio de Justicia y Seguridad de la Ciudad Autónoma de Buenos Aires (2021)")
                                       ),
                              tabPanel("2017",
                                       dygraphOutput("dygraph2"),
                                       helpText("Fuente: Datos abiertos del Ministerio de Justicia y Seguridad de la Ciudad Autónoma de Buenos Aires (2021)")
                              ),
                              tabPanel("2018",
                                       dygraphOutput("dygraph3"),
                                       helpText("Fuente: Datos abiertos del Ministerio de Justicia y Seguridad de la Ciudad Autónoma de Buenos Aires (2021)")
                              ),
                              tabPanel("2019",
                                       dygraphOutput("dygraph4"),
                                       helpText("Fuente: Datos abiertos del Ministerio de Justicia y Seguridad de la Ciudad Autónoma de Buenos Aires (2021)")
                              ),
                              tabPanel("2020",
                                       dygraphOutput("dygraph5"),
                                       helpText("Fuente: Datos abiertos del Ministerio de Justicia y Seguridad de la Ciudad Autónoma de Buenos Aires (2021)")
                              )
                 )
        ),
        tabPanel("Mapa del Delito",
                 navlistPanel("Por favor, seleccione un año:",
                              tabPanel('2016',
                                       leafletOutput("leaflet1"),
                                       helpText("Fuente: Datos abiertos del Ministerio de Justicia y Seguridad de la Ciudad Autónoma de Buenos Aires (2021)"),
                                       sliderInput("input_fecha", label = h3("seleccion del periodo"),
                                                   min = min(Delitos_2016$fecha),
                                                   max = max(Delitos_2016$fecha), 
                                                   ),
                                       br(),
                                       plotOutput("tabla_cantidad1")
                              ),
                              tabPanel('2017',
                                       leafletOutput("leaflet2"),
                                       helpText("Fuente: Datos abiertos del Ministerio de Justicia y Seguridad de la Ciudad Autónoma de Buenos Aires (2021)"),
                                       br(),
                                       plotOutput("tabla_cantidad2")
                              ),
                              tabPanel('2018',
                                       leafletOutput("leaflet3"),
                                       helpText("Fuente: Datos abiertos del Ministerio de Justicia y Seguridad de la Ciudad Autónoma de Buenos Aires (2021)")
                              ),
                              tabPanel('2019',
                                       leafletOutput("leaflet4"),
                                       helpText("Fuente: Datos abiertos del Ministerio de Justicia y Seguridad de la Ciudad Autónoma de Buenos Aires (2021)")
                              ),
                              tabPanel('2020',
                                       leafletOutput("leaflet5"),
                                       helpText("Fuente: Datos abiertos del Ministerio de Justicia y Seguridad de la Ciudad Autónoma de Buenos Aires (2021)")
                              
                              ))
                 ),
        tabPanel("Delitos por día de la Semana",
                 navlistPanel("Por favor, seleccione un año:",
                              tabPanel("2016",
                                       highchartOutput("delito_por_dia1"),
                                       helpText("Datos abiertos del Ministerio de Justicia y Seguridad de la Ciudad Autónoma de Buenos Aires (2021)")
                              ),
                              tabPanel("2017",
                                       highchartOutput("delito_por_dia2"),
                                       helpText("Datos abiertos del Ministerio de Justicia y Seguridad de la Ciudad Autónoma de Buenos Aires (2021)")
                              ),
                              tabPanel("2018",
                                       highchartOutput("delito_por_dia3"),
                                       helpText("Datos abiertos del Ministerio de Justicia y Seguridad de la Ciudad Autónoma de Buenos Aires (2021)")
                              ),
                              tabPanel("2019",
                                       highchartOutput("delito_por_dia4"),
                                       helpText("Datos abiertos del Ministerio de Justicia y Seguridad de la Ciudad Autónoma de Buenos Aires (2021)")
                              ),
                              tabPanel("2020",
                                       highchartOutput("delito_por_dia5"),
                                       helpText("Datos abiertos del Ministerio de Justicia y Seguridad de la Ciudad Autónoma de Buenos Aires (2021)")
                              
                              ))
        ),
        tabPanel("Estructura del delito",
                 mainPanel(
                     highchartOutput("variabilidad_delito"))
        ),
    tabPanel("Créditos",
                 mainPanel(
                     shiny::br(),
                     h3(strong("Autores")),
                     helpText(strong("Ruoppulo Ramiro")),
                     helpText("Estudiante de Sociología (UNL)"),
                     helpText(tags$a("LinkedIn",href="https://www.linkedin.com/in/melina-schamberger/")),
                     shiny::hr(),
                     helpText(strong("Cosentino Renzo")),
                     helpText("Estudiante de Sociologia (UNL)"),
                     helpText(tags$a("LinkedIn", href="https://www.linkedin.com/in/renzo-cosentino-987724216/")),
                     shiny::hr(),
                     helpText(strong("De Santis Octavio")),
                     helpText("Estudiante de Relaciones Internacionales (UTDT)"),
                     helpText(tags$a("LinkedIn",href="https://www.linkedin.com/in/octavio-de-santis-9a9711192")),
                     shiny::hr(),
                     helpText(strong("Pedrola Lito")),
                     helpText("Estudiante de Relaciones Internacionales (UTDT)"),
                     helpText(tags$a("LinkedIn", href="https://www.linkedin.com/in/miguel-pedrola-58a4461aa")),
                     shiny::hr(),
                     helpText("Este trabajo fue presentado como entrega final correspondiente al curso de 'Social Data Analitics' de Escuela Argentina de Nuevas Tecnologías"),
                     shiny::hr(),
                     helpText(tags$a("Codigo y bases de datos", href="https://github.com/MiguelPedrola/PROYECTO-FINAL"))
                 ))
        )
)

                 
  

        
 
                        