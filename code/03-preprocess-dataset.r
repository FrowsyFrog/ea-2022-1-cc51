#Pre-procesamiento 

hotel_data[duplicated(hotel_data),]
hotel_data_pre <- unique(hotel_data)

hotel_data_pre[hotel_data_pre == "NULL"] <- NA
hotel_data_pre[hotel_data_pre == ""] <- NA

hotel_data_pre$reservation_status_date <- as.Date(hotel_data_pre$reservation_status_date,"%m/%d/%Y")

View(hotel_data_pre)

#Eliminando la columna company porque mas de el 90% de los datos tenian valores inutilizables
#Ademas, esta columna no afecta a nuestros casos de analisis
hotel_data_pre2 <- subset(hotel_data_pre,select = -company)

View(hotel_data_pre2)
#Eliminando filas con valores inutilizables en la columna country(0,41% de los datos)
hotel_data_pre3 <- hotel_data_pre2[!is.na(hotel_data_pre2$country),]


View(hotel_data_pre3)

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