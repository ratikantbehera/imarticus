# Loading the data set
insurance<-read.csv('insurance.csv')

# Count for each categories of 'region'
aggregate(insurance$region,by=list(insurance$region),FUN=table)

# Find 50 records of highest ‘age’ and export data/table to desktop
a<-head(insurance[order(-insurance$age),],n=50)
write.csv(a,file='highestAge50.csv',row.names = FALSE)

# Describe the schema of table
str(insurance)

# Create view name as ‘gender’ where users can not see ‘sex’
gender<-insurance[,!(colnames(insurance) %in% c('sex'))]

# Rename the view as ‘type’
type<-gender
rm(gender)

# Count how many are ‘northwest’ insurance holders
nrow(insurance[insurance$region=='northwest',])

# Count how many insurance holders were ‘female’
nrow(insurance[insurance$sex=='female',])

# Create a new column ‘ratio’ which is age multiply by bmi
b <- insurance$age*insurance$bmi
insurance$ratio <- b

# Arrange the table from high to low according to charges
insurance[order(-insurance$charges),]

# Find MAX of ‘charges’
max(insurance$charges)

# Find MIN of ‘charges’
min(insurance$charges)

# Find average of ‘charges’ of male and female
aggregate(insurance$charges,by=list(insurance$sex),FUN=mean)

# rename column name sex to Gender
colnames(insurance)[colnames(insurance)=='sex']<-'gender'

# Add new column as HL_Charges where more than average charges should be categorized as HIGH and less than average charges should be categorized as LOW
d<-c()
for (x in insurance$charges){
  if (x>mean(insurance$charges)){
    d<-c(d,'High')
  }
  else{
    d<-c(d,'Low')
  }
}
insurance$HL_Charges <- d

# Change location/position of ‘smoker’ and bring before ‘children’
e<-colnames(insurance)
f<-c(e[1:4],'smoker','children',e[7:10])
insurance<-insurance[,f]

# Show top 20 records
head(insurance,n=20)

# Show bottom 20 records
tail(insurance,n=20)

# Randomly select 20% of records and export to desktop
g<-insurance[sample(nrow(insurance)),][1:round(0.2*nrow(insurance)),]
write.csv(g,file='Rand20pc.csv',row.names=FALSE)

# Remove column ‘ratio’
insurance<-insurance[,!(colnames(insurance) %in% 'ratio')]

# Create a view called Female_HL_Charges that shows only those data where HL_Charges is High, Female, Smokers and with 0 children
Female_HL_Charges<-insurance[insurance$HL_Charges=='High'&insurance$gender=='female'&insurance$smoker=='yes'&insurance$children==0,]

#  Update children column if there is 0 children then make it as Zero Children, if 1 then one_children, if 2 then two_children, if 3 then three_children, if 4 then four_children if 5 then five_children else print it as More_than_five_children.
h<-c()
for (x in insurance$children){
  if (x==0) h<-c(h,'Zero Children')
  else if (x==1) h<-c(h,'one_children')
  else if (x==2) h<-c(h,'two_children')
  else if (x==3) h<-c(h,'three_children')
  else if (x==4) h<-c(h,'four_children')
  else if (x==5) h<-c(h,'five_children')
  else h<-c(h,'More_than_five_children')
}
insurance$children<-h
