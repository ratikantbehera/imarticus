# loading the data set
cereal<-read.csv('cereals_data.csv')

# Describe the schema of table
str(cereal)

# Create view name as see where users can not see type column
a<-cereal[,!(colnames(cereal) %in% 'type')]

# Rename the view as saw
saw<-a
rm(a)

# Count how many are cold cereals
nrow(cereal[cereal$type=='C',])

# Count how many cereals are kept in shelf 3
nrow(cereal[cereal$shelf==3,])

# Arrange the table from high to low according to ratings
cereal[order(-cereal$rating),]

# Find average of calories of hot cereal and cold cereal
aggregate(cereal$calories,by=list(cereal$type),FUN=mean)

# Add new column as HL_Calories where more than average calories should be categorized as HIGH and less than average calories should be categorized as LOW
b<-c()
for (x in cereal$calories){
  if (x>mean(cereal$calories)) b<-c(b,'HIGH')
  else b<-c(b,'LOW')
}
cereal$HL_Calories<-b

# List only those cereals whose name begins with B
cereal[grep('^B',cereal$name),]

# List only those cereals whose name begins with F
cereal[grep('^F',cereal$name),]

# List only those cereals whose name ends with s
cereal[grep('s$',cereal$name),]

# Select only those records which are HIGH in column HL_calories and export to desktop
d<-cereal[cereal$HL_Calories=='HIGH',]
write.csv(d,'cerealHighCal.csv',row.names = FALSE)

# Find maximum of ratings
max(cereal$rating)

# Find average ratings of those were High and Low calories
aggregate(cereal$rating,by=list(cereal$HL_Calories),FUN=mean)

# Remove column fat
cereal<-cereal[,!(colnames(cereal) %in% 'fat')]

# Count records for each manufacturer [mfr]
aggregate(cereal$mfr,by=list(cereal$mfr),FUN=table)

# Select name, calories and ratings only
cereal[,c('name','calories','rating')]
