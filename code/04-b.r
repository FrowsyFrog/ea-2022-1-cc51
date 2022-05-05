#Esta aumentando la demanda con el tiempo?

table(hotel_data_pre3$arrival_date_year)
labels = as.character(unique(hotel_data_pre3$arrival_date_year))
num15 <- sum(hotel_data_pre3$arrival_date_year == 2015)
num16 <- sum(hotel_data_pre3$arrival_date_year == 2016)
num17 <- sum(hotel_data_pre3$arrival_date_year == 2017)
nums <- c(num15, num16, num17)
barplot(names = labels, height = nums,
        main = "Reservas por año",
        col = c("#52C1D3", "#8F52D3", "#93D352"), 
        xlab = "Años", ylab = "Número de reservas",
        ylim = c(0, 50000))
cambio1 <- num16/num15 * 100
cambio1 - 100

cambio2 <- num17/num16 * 100
cambio2 - 100
