#loading the data set
ctrial<-read.csv('clinictrial.csv')

# Describe the schema of table
str(ctrial)

# Find average of Age
mean(ctrial$Age)

# Find minimum of Age
min(ctrial$Age)

# Find maximum of Age
max(ctrial$Age)

# Find average age of those were pregnant and not pregnant
aggregate(ctrial$Age,by=list(ctrial$Pregnant),FUN=mean)

# Find average blood pressure of those had drug reaction and did not had drug reaction
aggregate(ctrial$BP,by=list(ctrial$Drug_Reaction),FUN=mean)

# Add new column name as ‘Age_group’ and those having age between 16 & 21 should be categorized as Low, more than 21 and less than 35 should be categorized as Middle and above 35 should be categorized as High.
a<-c()
for (x in ctrial$Age){
  if (x>=16 & x<21) a<-c(a,'Low')
  else if (x>=21 & x<35) a<-c(a,'Middle')
  else a<-c(a,'High')
}
ctrial$Age_group<-a

# Change ‘Age’ of Reetika to 32
ctrial[ctrial$Name=='Reetika','Age']=32

# Change name of Reena as Shara
ctrial[ctrial$Name=='Reena','Name']='Shara'

# Remove Chlstrl column
ctrial<-ctrial[,!(colnames(ctrial) %in% 'Chlstrl')]

# Select only Name, Age and BP
ctrial[,c('Name','Age','BP')]

# Select ladies whose first name starts with ‘E’
ctrial[grep('^E',ctrial$Name),]

# Select ladies whose Age_group were Low
ctrial[ctrial$Age_group=='Low',]

# Select ladies whose Age_group were High
ctrial[ctrial$Age_group=='High',]

# Select ladies whose name starts with ‘A’ and those were pregnant
b<-ctrial[grep('^A',ctrial$Name),]
b[b$Pregnant=='yes',]

# Identify ladies whose BP was more than 120
ctrial[ctrial$BP>120,]

# Identify ladies whose BP was between 100 and 120
ctrial[ctrial$BP>=100 & ctrial$BP<120,]

# Identify ladies who had low anxiety aged less than 30
ctrial[ctrial$Anxty_LH=='no' & ctrial$Age<30,]

# Select ladies whose name ends with ‘i’
ctrial[grep('i$',ctrial$Name),]

# Select ladies whose name ends with ‘a’
ctrial[grep('a$',ctrial$Name),]

# Select ladies whose name starts with ‘K’
ctrial[grep('^K',ctrial$Name),]

# Select ladies whose name have ‘a’ anywhere
ctrial[grep('^A|a+',ctrial$Name),]

# Order ladies in ascending way based on ‘BP’
ctrial[order(ctrial$BP),]

# Order ladies in descending way based on ‘Age’
ctrial[order(-ctrial$Age),]
