# Package ID: edi.913.1 Cataloging System:https://pasta.edirepository.org.
# Data set title: Extracellular enzyme activities in plots dominated by trees that associate with arbuscular mycorrhizal or ectomycorrhizal fungi in the nitrogen fertilized and reference watershed at the Bear Brook Watershed in Maine, USA during the final year of N fertilization (2016) and during the year after N fertilization ceased (2017)..
# Data set creator:  Joseph Carrara - West Virginia University 
# Data set creator:  Ivan Fernandez - University of Maine, School of Forest Resources and Climate Change Institute 
# Data set creator:  Edward Brzostek - West Virginia University 
# Contact:  Joseph Carrara -  West Virginia University  - jocarrara@mix.wvu.edu
# Stylesheet v2.11 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu 

inUrl1  <- "https://pasta.lternet.edu/package/data/eml/edi/913/1/453e739c16e7226100a3b3b66c190d53" 
infile1 <- tempfile()
try(download.file(inUrl1,infile1,method="curl"))
if (is.na(file.size(infile1))) download.file(inUrl1,infile1,method="auto")

                   
 dt1 <-read.csv(infile1,header=F 
          ,skip=1
            ,sep=","  
        , col.names=c(
                    "Year",     
                    "Watershed",     
                    "Treatment",     
                    "Mycorrhizae",     
                    "Plot",     
                    "SoilFraction",     
                    "AP",     
                    "BG",     
                    "NAG"    ), check.names=TRUE)
               
unlink(infile1)
		    
# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
                
if (class(dt1$Watershed)!="factor") dt1$Watershed<- as.factor(dt1$Watershed)
if (class(dt1$Treatment)!="factor") dt1$Treatment<- as.factor(dt1$Treatment)
if (class(dt1$Mycorrhizae)!="factor") dt1$Mycorrhizae<- as.factor(dt1$Mycorrhizae)
if (class(dt1$Plot)!="factor") dt1$Plot<- as.factor(dt1$Plot)
if (class(dt1$SoilFraction)!="factor") dt1$SoilFraction<- as.factor(dt1$SoilFraction)
if (class(dt1$AP)=="factor") dt1$AP <-as.numeric(levels(dt1$AP))[as.integer(dt1$AP) ]               
if (class(dt1$AP)=="character") dt1$AP <-as.numeric(dt1$AP)
if (class(dt1$BG)=="factor") dt1$BG <-as.numeric(levels(dt1$BG))[as.integer(dt1$BG) ]               
if (class(dt1$BG)=="character") dt1$BG <-as.numeric(dt1$BG)
if (class(dt1$NAG)=="factor") dt1$NAG <-as.numeric(levels(dt1$NAG))[as.integer(dt1$NAG) ]               
if (class(dt1$NAG)=="character") dt1$NAG <-as.numeric(dt1$NAG)
                
# Convert Missing Values to NA for non-dates
                


# Here is the structure of the input data frame:
str(dt1)                            
attach(dt1)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(Year)
summary(Watershed)
summary(Treatment)
summary(Mycorrhizae)
summary(Plot)
summary(SoilFraction)
summary(AP)
summary(BG)
summary(NAG) 
                # Get more details on character variables
                 
summary(as.factor(dt1$Watershed)) 
summary(as.factor(dt1$Treatment)) 
summary(as.factor(dt1$Mycorrhizae)) 
summary(as.factor(dt1$Plot)) 
summary(as.factor(dt1$SoilFraction))
detach(dt1)               
        




