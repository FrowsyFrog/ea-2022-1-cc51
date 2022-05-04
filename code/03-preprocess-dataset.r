#Pre-procesamiento 

#Cargar solo los datos unicos
hotel_data_pre <- unique(hotel_data)

#Convertir todos los datos no utilizables a NA
hotel_data_pre[hotel_data_pre == "NULL"] <- NA
hotel_data_pre[hotel_data_pre == ""] <- NA

#Eliminando redundancia (Undefined es lo mismo que SC segun documentacion)
hotel_data_pre[hotel_data_pre == "Undefined"] <- "SC"

#Convertir datos de tiempo a Date
hotel_data_pre$reservation_status_date <- as.Date(hotel_data_pre$reservation_status_date,"%m/%d/%Y")

#Eliminando la columna company porque mas de el 90% de los datos tenian valores inutilizables
#Ademas, esta columna no afecta a nuestros casos de analisis
hotel_data_pre2 <- subset(hotel_data_pre,select = -company)

#Eliminando filas con valores inutilizables en la columna country(0,41% de los datos)
hotel_data_pre2 <- hotel_data_pre2[!is.na(hotel_data_pre2$country),]

#Convertir datos inutilizables de lead_time al promedio de los normales
hotel_data_pre2$lead_time <- ifelse(is.na(hotel_data_pre2$lead_time), mean(hotel_data_pre2$lead_time, na.rm = TRUE), hotel_data_pre2$lead_time)
#Funciones para cambiar valores NA a valores aleatorios que si existen
rand.valor <- function(x) {
  faltantes <- is.na(x)
  tot.faltantes <- sum(faltantes)
  x.obs <- x[!faltantes]
  valorado <- x
  valorado[faltantes] <- sample(x.obs, tot.faltantes, replace = TRUE)
  return (valorado)
}
random.df <- function(df) {
  nombres <- names(df)
  for (nombre in nombres) {
    df[nombre] <- rand.valor(df[,nombre])
  }
  df
}
#Asignando valores aleatorios a los NA del dataframe
hotel_data_pre2 <- random.df(hotel_data_pre2)
View(hotel_data_pre2)
#Tranformando variables a factores
hotel_data_pre3$hotel <- factor(hotel_data_pre3$hotel)#
hotel_data_pre3$agent <- factor(hotel_data_pre3$agent)#
hotel_data_pre3$is_canceled <- factor(hotel_data_pre3$is_canceled)#
hotel_data_pre3$is_repeated_guest <- factor(hotel_data_pre3$is_repeated_guest)#
hotel_data_pre3$arrival_date_month <- factor(hotel_data_pre3$arrival_date_month)#
hotel_data_pre3$meal <- factor(hotel_data_pre3$meal)#
hotel_data_pre3$country <- factor(hotel_data_pre3$country)#
hotel_data_pre3$market_segment <- factor(hotel_data_pre3$market_segment)#
hotel_data_pre3$distribution_channel <- factor(hotel_data_pre3$distribution_channel)#
hotel_data_pre3$reserved_room_type <- factor(hotel_data_pre3$reserved_room_type)#
hotel_data_pre3$assigned_room_type <- factor(hotel_data_pre3$assigned_room_type)#
hotel_data_pre3$deposit_type <- factor(hotel_data_pre3$deposit_type)#
hotel_data_pre3$customer_type <- factor(hotel_data_pre3$customer_type)#
hotel_data_pre3$reservation_status <- factor(hotel_data_pre3$reservation_status)#

str(hotel_data_pre3)