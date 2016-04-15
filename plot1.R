# FineParticulateMatter - Course Assignment for Week Four of JHU Coursera course called, "Exploratory Data Analysis"
#
# plot1.R
#
#       The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say
        about fine particulate matter pollution in the United states over the 10-year period 1999-2008.
#
#       Question - Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
#
####
#
#   Setup Libraries, Directories, and URLs
#
## Create the data folder
if(!file.exists("data")) {
    dir.create("data")
    print("Created data folder.")
}
## Download the zip file for the course
if(!file.exists("./data/data.zip")) {
    print("Downloading data.zip...")
    download.file(projectDataURL, destfile = "./data/data.zip", mode = "wb")
    print("Downloading data.zip completed.")
}
#if(!file.exists("./data/zipcontents")) {
    print("Unzipping data.zip...")
    unzip("./data/data.zip", exdir="./data/zipcontents")
    print("Unzipping data.zip completed.")
}

## This first line will likely take a few seconds. Be patient!
print("Reading data files.")
NEI <- readRDS("./data/zipcontents/summarySCC_PM25.rds")
SCC <- readRDS("./data/zipcontents/Source_Classification_Code.rds")
print("Reading data files completed.")
#
#
#
# Plot 1
emissionsByYear <- aggregate(NEI$Emissions, by = list(NEI$year), FUN=sum, na.rm=TRUE)
names(emissionsByYear) <- c("year", "total")

png(filename = "plot1.png", width = 480, height = 480, units = "px")
plot(emissionsByYear$year, emissionsByYear$total/1000, type="b", main="Total US PM2.5 Emission From All Sources",
     xlab="Year", ylab="Total Emissions (1,000 Tons)", ylim=c(0, max(emissionsByYear$total/1000)))
dev.off()
