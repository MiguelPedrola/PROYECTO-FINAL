#

#############################################################################################

server <- function(input,output, session) {
  
  df.filt <- reactive({
    df.filt=df[Delitos_2016$fecha>=input$input_fecha[1] 
               & Delitos_2016$fecha<=input$input_fecha[2],]
    df.filt
  })
  
  
  output$dygraph1 <- renderDygraph({
    dygraph(delitos_xts, ylab = "Frecuencia", xlab = "Fecha",
            main = "Frecuencia de delitos ocurridos por fecha en CABA-Año 2016")%>%
      dySeries( label = "Homicidios")%>%
      dySeries( label = "Robos sin violencia")%>%
      dySeries(label = "Lesiones")%>%
      dySeries(label = "Robos con violencia")%>%
      dyOptions(colors = RColorBrewer::brewer.pal(4, "Set2"))%>%
      dyOptions(fillGraph = T, fillAlpha = 0.4)%>%
      dyLegend(width = 400)%>%
      dyRangeSelector()
  })
    
  output$dygraph2 <- renderDygraph({
    dygraph(delitos_por_dia_2017, ylab = "Frecuencia delitos",xlab = "Fecha", 
            main = "Frecuencia de delitos ocurridos por fecha en CABA-Año 2017")%>%
      dySeries( label = "Homicidios")%>%
      dySeries( label = "Robos sin violencia")%>%
      dySeries(label = "Lesiones")%>%
      dySeries(label = "Robos con violencia")%>%
      dyOptions(colors = RColorBrewer::brewer.pal(4, "Set2"))%>%
      dyOptions(fillGraph = T, fillAlpha = 0.4)%>%
      dyLegend(width = 400)%>%
      dyRangeSelector()
  })
  
  output$dygraph3 <- renderDygraph({
    dygraph(delitos_por_dia_2018, ylab = "Frecuencia delitos",xlab = "Fecha", 
            main = "Frecuencia de delitos ocurridos por fecha en CABA-Año 2018")%>%
      dySeries( label = "Homicidios")%>%
      dySeries( label = "Robos sin violencia")%>%
      dySeries(label = "Lesiones")%>%
      dySeries(label = "Robos con violencia")%>%
      dyOptions(colors = RColorBrewer::brewer.pal(4, "Set2"))%>%
      dyOptions(fillGraph = T, fillAlpha = 0.4)%>%
      dyLegend(width = 400)%>%
      dyRangeSelector()
  })
  output$dygraph4 <- renderDygraph({
    dygraph(delitos_por_dia_2019, ylab = "Frecuencia delitos",xlab = "Fecha", 
            main = "Frecuencia de delitos ocurridos por fecha en CABA-Año 2019")%>%
      dySeries( label = "Homicidios")%>%
      dySeries( label = "Robos sin violencia")%>%
      dySeries(label = "Lesiones")%>%
      dySeries(label = "Robos con violencia")%>%
      dyOptions(colors = RColorBrewer::brewer.pal(4, "Set2"))%>%
      dyOptions(fillGraph = T, fillAlpha = 0.4)%>%
      dyLegend(width = 400)%>%
      dyRangeSelector()
  })
  output$dygraph5 <- renderDygraph({
    dygraph(delitos_2020_xts, ylab = "Frecuencia delitos", xlab = "Fecha", 
            main = "Frecuencia de delitos ocurridos por fecha en CABA-Año 2020")%>%
      dySeries( label = "Homicidios")%>%
      dySeries( label = "Robos sin violencia")%>%
      dySeries(label = "Lesiones")%>%
      dySeries(label = "Robos con violencia")%>%
      dyOptions(colors = RColorBrewer::brewer.pal(4, "Set2"))%>%
      dyOptions(fillGraph = T, fillAlpha = 0.4)%>%
      dyLegend(width = 400)%>%
      dyRangeSelector()%>%
      dyEvent("2020-03-20", "Inicio ASPO", labelLoc = "top")
  })
  

  output$leaflet1<- renderLeaflet ({
      Delitos_2016%>%
      leaflet()%>%
      addProviderTiles(providers$CartoDB)%>%
      addCircles(lat = ~lat, lng = ~long, 
                 color = ~paleta(tipo_delito),
                 fillOpacity = 0.5,
                 label = ~tipo_delito,
                 popup = ~momento_del_dia,
                 group = "Delitos")%>%
      leaflet::addLegend(data=Delitos_2016, "bottomright",
                         pal=paleta,
                         values= ~tipo_delito,
                         title = "Tipo de Delitos",
                         opacity=0.5,
                         group="Leyenda")%>% 
        addLayersControl(overlayGroups = Grupos, 
                         options = layersControlOptions(collapsed = T))
    })
  output$tabla_cantidad1 <- renderPlot(
    ggplot(delitos_puntos_2016) +
      theme_light()+
      geom_sf(data = comunas_caba, fill = "white") +
      geom_sf(data = delitos_puntos_2016, aes(color=tipo_delito, alpha = 1), size=1) +
      labs(title = paste("CABA - Mapa del delito"), 
           subtitle = paste0("Delitos por tipo en la Ciudad de Buenos Aires - Año 2016\n") , 
           caption = "Fuente: data.buenosaires.gob.ar", 
           y = "", 
           x = ""
      ) +
      theme (axis.text.x=element_blank(),
             axis.ticks.x=element_blank(),
             axis.title.y=element_blank(),
             axis.text.y=element_blank(),
             axis.ticks.y=element_blank(),
             legend.position = "none") +
      facet_grid(cols = vars(tipo_delito))
  )
  output$leaflet2 <- renderLeaflet({
    Delitos_2017%>%
      leaflet()%>%
      addProviderTiles(providers$CartoDB.DarkMatter)%>%
      addCircles(lat = ~lat, lng = ~long, 
                 color = ~paleta(tipo_delito),
                 fillOpacity = 0.5,
                 label = ~tipo_delito,
                 popup = ~momento_del_dia,
                 group = "Delitos")%>%
      leaflet::addLegend(data=Delitos_2017, "bottomright",
                         pal=paleta,
                         values= ~tipo_delito,
                         title = "Tipo de Delitos",
                         opacity=0.5,
                         group="Leyenda")
})
  
  output$tabla_cantidad2 <- renderPlot(
    ggplot(delitos_puntos_2017) +
      geom_sf(data = comunas, fill = "white") +
      geom_sf(data = delitos_puntos_2017, aes(color=tipo_delito, alpha = 1), size=1) +
      theme_light()+
      labs(title = paste("CABA - Mapa del delito"), 
           subtitle = paste0("Delitos por tipo en la Ciudad de Buenos Aires - Año 2017") , 
           caption = "Fuente: data.buenosaires.gob.ar", 
           y = "", 
           x = ""
      ) +
      theme (axis.text.x=element_blank(),
             axis.ticks.x=element_blank(),
             axis.title.y=element_blank(),
             axis.text.y=element_blank(),
             axis.ticks.y=element_blank(),
             legend.position = "none") +
      facet_grid(cols = vars(tipo_delito))
  )
  output$leaflet3 <- renderLeaflet({
    Delitos_2018%>%
      leaflet()%>%
      addProviderTiles(providers$CartoDB.DarkMatter)%>%
      addCircles(lat = ~lat, lng = ~long, 
                 color = ~paleta(tipo_delito),
                 fillOpacity = 0.5,
                 label = ~tipo_delito,
                 popup = ~momento_del_dia,
                 group = "Delitos")%>%
      leaflet::addLegend(data=Delitos_2018, "bottomright",
                         pal=paleta,
                         values= ~tipo_delito,
                         title = "Tipo de Delitos",
                         opacity=0.5,
                         group="Leyenda")
  })
  output$leaflet4 <- renderLeaflet({
    Delitos_2019%>%
      leaflet()%>%
      addProviderTiles(providers$CartoDB.DarkMatter)%>%
      addCircles(lat = ~lat, lng = ~long, 
                 color = ~paleta(tipo_delito),
                 fillOpacity = 0.5,
                 label = ~tipo_delito,
                 popup = ~momento_del_dia,
                 group = "Delitos")%>%
      leaflet::addLegend(data=Delitos_2019, "bottomright",
                         pal=paleta,
                         values= ~tipo_delito,
                         title = "Tipo de Delitos",
                         opacity=0.5,
                         group="Leyenda")
  })
  output$leaflet5 <- renderLeaflet({
    Delitos_2020%>%
      leaflet()%>%
      setView(lng = -58.445531, lat = -34.606653, zoom = 11)%>%
      addProviderTiles(providers$CartoDB.DarkMatter)%>%
      addCircles(lat = ~latitud, lng = ~longitud, 
                 color = ~paleta(tipo),
                 fillOpacity = 0.5,
                 label = ~tipo,
                 popup = ~momento_del_dia,
                 group = "Delitos")%>%
      leaflet::addLegend(data=Delitos_2020, "bottomright",
                         pal=paleta,
                         values= ~tipo,
                         title = "Tipo de Delitos",
                         opacity=0.5,
                         group="Leyenda")
  })
  
  output$delito_por_dia1 <- renderHighchart(
    Dias_delitos%>%hchart("bar",
                          hcaes(x=Dias,
                                y=cantidad,
                                group=tipo_delito),
                          stacking="normal")%>%
        hc_add_theme(hc_theme_elementary())%>%
      hc_title(text="Frecuencia delitos por dia")%>%
      hc_subtitle(text="CABA-Año 2016")%>%
      hc_caption(text="Fuente: data.buenosaires.gob.ar")%>%
      hc_yAxis(title=list(text="Frecuencia",
                          aling="high",
                          margin=10))%>%
      hc_xAxis(title=list(text=""))
    )
  
  output$delito_por_dia2 <- renderHighchart(
    Dias_2017%>%hchart("bar",
                       hcaes(x=Dias,
                             y=cantidad,
                             group=tipo_delito),
                       stacking="normal")%>%
      hc_add_theme(hc_theme_alone())%>%
      hc_title(text="Frecuencia delitos por dia")%>%
      hc_subtitle(text="CABA-Año 2017")%>%
      hc_caption(text="Fuente: data.buenosaires.gob.ar")%>%
      hc_yAxis(title=list(text="Frecuencia",
                          aling="high",
                          margin=10))%>%
      hc_xAxis(title=list(text=""))
  )
  
  output$delito_por_dia3 <- renderHighchart(
    Dias_2018%>%hchart("bar",
                       hcaes(x=Dias,
                             y=cantidad,
                             group=tipo_delito),
                       stacking="normal")%>%
      hc_add_theme(hc_theme_alone())%>%
      hc_title(text="Frecuencia delitos por dia")%>%
      hc_subtitle(text="CABA-Año 2018")%>%
      hc_caption(text="Fuente: data.buenosaires.gob.ar")%>%
      hc_yAxis(title=list(text="Frecuencia",
                          aling="high",
                          margin=10))%>%
      hc_xAxis(title=list(text=""))
    )
  
  output$delito_por_dia4 <- renderHighchart(
    Dias_2019%>%hchart("bar",
                       hcaes(x=Dias,
                             y=cantidad,
                             group=tipo_delito),
                       stacking="normal")%>%
      hc_add_theme(hc_theme_alone())%>%
      hc_title(text="Frecuencia delitos por dia")%>%
      hc_subtitle(text="CABA-Año 2019")%>%
      hc_caption(text="Fuente: data.buenosaires.gob.ar")%>%
      hc_yAxis(title=list(text="Frecuencia",
                          aling="high",
                          margin=10))%>%
      hc_xAxis(title=list(text=""))
  )
  output$delito_por_dia5 <- renderHighchart(
    Dias_2020%>%hchart("bar",
                       hcaes(x=Dias,
                             y=cantidad,
                             group=tipo),
                       stacking="normal")%>%
      hc_add_theme(hc_theme_alone())%>%
      hc_title(text="Frecuencia delitos por dia")%>%
      hc_subtitle(text="CABA-Año 2020")%>%
      hc_caption(text="Fuente: data.buenosaires.gob.ar")%>%
      hc_yAxis(title=list(text="Frecuencia",
                          aling="high",
                          margin=10))%>%
      hc_xAxis(title=list(text=""))
  )
  
  output$variabilidad_delito <- renderHighchart(
    hchart(delitos_por_mes_completa,
           "line",
           hcaes(x=anio_mes, y=cantidad, group=tipo_delito))%>%
      hc_add_theme(hc_theme_elementary())%>%
      hc_title(text="Variabilidad de la estructura del delito")%>%
      hc_subtitle(text="Año 2016-2020/CABA")%>%
      hc_caption(text="Fuente: data.buenosaires.gob.ar")%>%
      hc_yAxis(title=list(text="Frecuencia de delitos",
                          aling="high",
                          margin=10))%>%
      hc_xAxis(title=list(text="Linea temporal"))%>%
      hc_navigator(enabled=T)
  )
  }

#### appppp ####

shinyApp(ui = ui, server = server)



# Run the application 

