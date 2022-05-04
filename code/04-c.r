# ¿Cuándo es menor la demanda de reservas?

library(ggplot2)

#Ordenar categorias por mes
hotel_data_pre3$arrival_date_month <- 
 ordered(hotel_data_pre3$arrival_date_month, levels = month.name)

barplot(
    table(hotel_data_pre3$arrival_date_month),
    col = c("#0072B2", "#D55E00"),
    main = "Demanda de reservas por mes",
    xlab = "Mes",
    ylab = "Cantidad de reservas",
    names = c("Enero", "Febrero", "Marzo",
     "Abril", "Mayo", "Junio", "Julio",
     "Agosto", "Septiembre", "Octubre",
     "Noviembre", "Diciembre")
)

#Se puede observar que la menor cantidad de demandas se da entre
# los meses de noviembre, diciembre y enero
