# Load dataset
pills <- read.csv("/users/krishnasubramanian/Desktop/CTHCI Stats Workshop/pills.csv", sep=";")
head(pills)

### weightLoss ~ participantGender ###

# Subset the data
participants.male.weightLoss <- subset(pills, participantGender == "M", select = c(weightLoss))
participants.female.weightLoss <- subset(pills, participantGender == "F", select = c(weightLoss))

# Plot histograms and boxplot
hist(participants.male.weightLoss$weightLoss) # Lots of right-skew, may not be normally distributed
hist(participants.female.weightLoss$weightLoss)
plot(weightLoss ~ participantGender, data = pills) # Does not look like there's a difference

## Test assumptions

# Test if the distributions are Gaussian/normally distributed
shapiro.test(participants.male.weightLoss$weightLoss) # Not normally distributed
shapiro.test(participants.female.weightLoss$weightLoss) # Normally distributed

# Test if the variances are roughly the same
library(car)
leveneTest(weightLoss ~ participantGender, data = pills) # Variances are similar

# Perform Mann-Whitney U test
wilcox.test(participants.male.weightLoss$weightLoss, participants.female.weightLoss$weightLoss) # p - 0.9825


### weightLoss ~ pillType ### 

# Subset the data
redPill.weightLoss <- subset(pills, pillType == "Red", select = c(weightLoss))
greenPill.weightLoss <- subset(pills, pillType == "Green", select = c(weightLoss))
bluePill.weightLoss <- subset(pills, pillType == "Blue", select = c(weightLoss))

# Plot histograms and boxplot
hist(redPill.weightLoss$weightLoss)
hist(greenPill.weightLoss$weightLoss)
hist(bluePill.weightLoss$weightLoss)
plot(weightLoss ~ pillType, data = pills) # There could be a difference

## Test assumptions

# Test if the distributions are Gaussian/normally distributed
shapiro.test(redPill.weightLoss$weightLoss) # Normally distributed
shapiro.test(greenPill.weightLoss$weightLoss) # Normally distributed
shapiro.test(bluePill.weightLoss$weightLoss) # Normally distributed

# Test if the variances are roughly the same
bartlett.test(weightLoss ~ pillType, data = pills) # Variances are similar

# Perform one-way ANOVA
model <- aov(weightLoss ~ pillType, data = pills)
results <- anova(model)
results

# Perform post-hoc analysis 
TukeyHSD(model)

