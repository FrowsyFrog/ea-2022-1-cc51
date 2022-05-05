#Cuantas reservas se realizan por tipo de hotel? o Que tipo de hotel prefiere la gente?

#Analasis con data preprocesada

table(hotel_data_pre3$hotel)
num_city <- length(hotel_data_pre3$hotel[hotel_data_pre3$hotel == "City Hotel"])
num_city
num_resort <- length(hotel_data_pre3$hotel[hotel_data_pre3$hotel == "Resort Hotel"])
num_resort
nums <- c(num_city, num_resort)
porcentajes <- round(nums/sum(nums)*100)
labels = levels(hotel_data_pre3$hotel)
labels <- paste(labels, porcentajes, sep = " ")
labels <- paste(labels, "%", sep = "")
pie(nums, labels = labels,
    main = "Tipo de Hotel",
    sub = "Data sin outliers",
    col = c("#0072B2", "#D55E00"))
num_city - num_resort
mayor <- num_city/num_resort * 100
mayor - 100
