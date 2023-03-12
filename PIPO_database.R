## Creating my PIPO database design for SQL
# load packages ----
library(DBI)

# establish a connection with the database
PIPO_db <- dbConnect(RSQLite::SQLite(),
                        "/Users/nadav/Documents/USU/Thesis/MS/PIPO.db")

# creating the 'plots' table
dbExecute(PIPO_db, "CREATE TABLE plots (
          plot_id varchar(15) NOT NULL,
          x_coord double,
          y_coord double,
          severity varchar(5),
          PRIMARY KEY (plot_id)
);")

# creating the 'fuels' table
dbExecute(PIPO_db, "CREATE TABLE fuels (
          transect varchar(15) NOT NULL,
          plot_id varchar(15),
          1_hr double,
          10_hr double,
          100_hr double,
          1000_hr double,
          duff_litter double,
          PRIMARY KEY (transect)
);")

# creating the 'PIPO' table
dbExecute(PIPO_db, "CREATE TABLE pipo (
          seedling_num double NOT NULL,
          plot_id varchar(15),
          height_cm double,
          diam_cm double,
          azimuth double,
          position double,
          distance_cm double,
          PRIMARY KEY (seedling_num)
);")

# creating the 'community' table
dbExecute(PIPO_db, "CREATE TABLE community (
          quad_number double NOT NULL,
          plot_id varchar(15),
          species varchar(10),
          percent_cover double,
          PRIMARY KEY (quad_number)
);")
