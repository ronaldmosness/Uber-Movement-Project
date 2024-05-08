library(dplyr)
set.seed(123456)

# Define file paths
file_path_2019_2 <- "path/to/atlanta-censustracts-2019-2-All-HourlyAggregate.csv"
file_path_2019_3 <- "path/to/atlanta-censustracts-2019-3-All-HourlyAggregate.csv"
file_path_2019_4 <- "path/to/atlanta-censustracts-2019-4-All-HourlyAggregate.csv"
file_path_2020_1 <- "path/to/atlanta-censustracts-2020-1-All-HourlyAggregate.csv"

# Read data from CSV files using defined file paths
df_hour <- read.csv(file_path_2019_2) %>%
  bind_rows(read.csv(file_path_2019_3)) %>%
  bind_rows(read.csv(file_path_2019_4)) %>%
  bind_rows(read.csv(file_path_2020_1))

# Combine source and location ID
df_hour$loc_pair <- paste0(df_hour$sourceid, "-", df_hour$dstid)

# Calculate hourly trips
location_hourly_trips <- df_hour %>%
  group_by(sourceid) %>%
  summarise(pickup = n()) %>%
  right_join(
    df_hour %>%
      group_by(dstid) %>%
      summarise(dropoff = n()),
    by = c("sourceid" = "dstid")
  ) %>%
  rename(locationid = sourceid) %>%
  ungroup() %>%
  mutate(across(everything(), ~replace(., is.na(.), 0))) 

# Prepare data for kmeans run
location_hourly_trips_for_kmeans <- location_hourly_trips %>%
  dplyr::select(-locationid)

# Find the best k
range_k <- 1:10
wcss <- numeric(length(range_k))

for (i in 1:length(range_k)) {
  kmeans_result <- kmeans(location_hourly_trips_for_kmeans, centers = range_k[i])
  wcss[i] <- kmeans_result$tot.withinss
}

plot(range_k, wcss, type = "b", xlab = "Number of Clusters (k)", ylab = "WCSS")

nb_cluster <- 3

# Perform kmeans clustering
kmeans_result <- kmeans(location_hourly_trips_for_kmeans, centers = nb_cluster)
location_hourly_trips_for_kmeans$cluster <- kmeans_result$cluster
location_hourly_trips$cluster <- kmeans_result$cluster

# Select relevant columns for output
cluster_locationid_based_on_pickup_dropoff_data <- location_hourly_trips %>%
  dplyr::select(locationid, cluster)

# Define output file path
output_file_path <- "path/to/output/3_cluster_locationid_based_on_pickup_dropoff_data.csv"

# Write output to CSV
write.csv(cluster_locationid_based_on_pickup_dropoff_data, output_file_path, row.names = FALSE)