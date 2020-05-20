# Load dataset
pills <- read.csv("/users/krishnasubramanian/Desktop/CTHCI Stats Workshop/weightLoss.csv",sep=";")
pills

# Generate participantID
participantID <- sample(c(1:300), rep=F)

# Generate participantGender
participantGender <- sample(c("M", "F"), 300, replace = T, prob = c(0.5, 0.5))
participantGender

# Generate pillType
pillType <- rep(c("Red", "Green", "Blue"), each=100)

# Generate weightLoss
weightLoss.red <- sort(rnorm(100, 0.5, 1.5))
weightLoss.green <- sort(rnorm(100, 2, 1.5))
weightLoss.blue <- sort(rnorm(100, 3.5, 1.5))
weightLoss <- c(weightLoss.red, weightLoss.green, weightLoss.blue)

# Generate muscleLoss
fatLoss.red <- sort(3*rexp(100, 4))
fatLoss.green = sort(5*rexp(100, 5))
fatLoss.blue = sort(8*rexp(100, 4))
fatLoss <- c(fatLoss.red, fatLoss.green, fatLoss.blue)

# Generate rating
rating.red <- sample(c(1:5), 100, rep=T)
rating.green <- sample(c(1:5), 100, rep=T)
rating.blue <- sample(c(1:5), 100, rep=T)
rating <- c(rating.red, rating.green, rating.blue)

pills$participantID <- participantID
pills$participantGender <- participantGender
pills$pillType <- pillType
pills$weightLoss <- weightLoss
pills$muscleLoss <- fatLoss
pills$rating <- rating

pills

write.csv(pills, file="/users/krishnasubramanian/Desktop/CTHCI Stats Workshop/pills.csv", sep=";")
