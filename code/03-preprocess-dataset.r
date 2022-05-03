#Pre-process Dataset

#Transform variable to factor
hotel_data$ï..hotel <- factor(hotel_data$ï..hotel)
hotel_data$arrival_date_month <- factor(hotel_data$arrival_date_month)
hotel_data$meal <- factor(hotel_data$meal)
hotel_data$country <- factor(hotel_data$country)
hotel_data$market_segment <- factor(hotel_data$market_segment)
hotel_data$distribution_channel <- factor(hotel_data$distribution_channel)
hotel_data$reserved_room_type <- factor(hotel_data$reserved_room_type)
hotel_data$assigned_room_type <- factor(hotel_data$assigned_room_type)
hotel_data$deposit_type <- factor(hotel_data$deposit_type)
hotel_data$customer_type <- factor(hotel_data$customer_type)
hotel_data$reservation_status <- factor(hotel_data$reservation_status)

str(hotel_data)
