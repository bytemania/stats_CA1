# A
library(tidyr)
library(plotly)

current_year <- as.numeric(format(Sys.Date(), "%Y"))

rain_data <- data.frame(Year = (current_year - 20):(current_year - 1), Cork = runif(20, 0, 28), Dublin = runif(20, 0, 28))

df_rain_data <- gather(rain_data, City, Rain, c(Dublin,Cork))

ggplot(data=df_rain_data, aes(x = Year, fill = City)) + 
  geom_area(aes(y = Rain), position = position_dodge(width = 0), alpha=0.8) +
  ylab("Average Rain") + 
  ggtitle("Average rain per Year in Dublin and Cork") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) 

ggsave('dublin-cork-rain.png') 


#b

df_world_small <- read.csv("world-small.csv", header = TRUE)

# i
ggplot(df_world_small, aes(x = gdppcap08)) +
  geom_histogram(binwidth = 1000) +
  labs(title = "GDP per Capita in 2008", x = "GDP per Capita", y = "Frequency") +
  theme_bw() + 
  theme(plot.title = element_text(hjust = 0.5)) 
ggsave('gdppcap08.png') 

# ii
ggplot(df_world_small, aes(y = polityIV)) + 
       geom_boxplot() +
       labs(title = "Polity IV Scores Chart", x = "", y = "Polity IV Score") +
       theme_bw() + 
       theme(plot.title = element_text(hjust = 0.5),
             axis.title.x=element_blank(),
             axis.text.x=element_blank(),
             axis.ticks.x=element_blank(),
             panel.grid.major.x = element_blank(),
             panel.grid.minor.x = element_blank()) 
ggsave('polityiv.png') 

ggplot(df_world_small, aes(y = polityIV, x = region)) + 
      geom_boxplot() +
      labs(title = "Polity IV Per Region Scores Chart", x = "Region", y = "Polity IV Score") +
      theme_bw() + 
      theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) 
ggsave('polityiv-per-region.png') 

# iii
region_biggest_gdpcap08 <- df_world_small[which.max(df_world_small$gdppcap08), "region"]
print(region_biggest_gdpcap08)

# iv
country_with_min_polityiv <- df_world_small[which.min(df_world_small$polityIV), "country"]
countries_with_min_polityiv <- df_world_small[df_world_small$polityIV == min(df_world_small$polityIV), "country"]

print(country_with_min_polityiv)
print(countries_with_min_polityiv)

# c
pets_text <- "Pet Number_of_people
              Dogs	2034
              Cats	492
              Fish	785
              Macaw	298"

df_pets <- read.table(text = pets_text, header = TRUE)

ggplot(data = df_pets, aes(x ="" , y = Number_of_people, fill = Pet)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start=0) +
  labs(title = "Pet Lovers Pie Chart") +
  theme_bw() + 
  theme_void() +
  theme(plot.title = element_text(hjust = 0.5))
ggsave('pets-pie.png') 

ggplot(data = df_pets, aes(x = Pet, y = Number_of_people)) + 
   geom_bar(stat = "identity") +
   labs(title = "Pet Lovers Bar Chart", x = "Pet", y = "Number of People") +
   theme_bw() +
   theme(plot.title = element_text(hjust = 0.5))
ggsave('pets-bar.png') 
