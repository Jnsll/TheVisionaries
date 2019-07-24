myC <- read.table("path/to/myOut.csv", sep=",", header=TRUE)
c <- data.frame(myC)

plot(c$humanInformedRatio, c$rescuedDynamic)
abline(v = median(c$humanInformedRatio), col="red")

plot(c$humanInformProbability, c$rescuedDynamic)
abline(v = median(c$humanInformProbability), col="red")

plot(c$humanFollowProbability, c$rescuedDynamic)
abline(v = median(c$humanFollowProbability), col="red")







myT <- read.table("path/to/20190627_144403_soboling.csv", header=TRUE, sep=",")
t <- data.frame(myT)

ggplot(t, aes(percentCivilianGlassesWearers, civilianPerception)) + geom_point(aes(size = totalZombified, colour = totalZombified)) + scale_colour_gradient2()

ggplot(t, aes(civilianPerception, redCrossPerception)) + geom_point(aes(size = totalZombified, colour = totalZombified)) + scale_colour_gradient2()

t$logZoms <- log2(t$totalZombified)

plot(t$redCrossPerception, t$totalZombified)


plot(t$percentCivilianGlassesWearers, t$totalZombified)
abline(lm(t$totalZombified ~ t$percentCivilianGlassesWearers), col="red")


fit <- lm(totalZombified ~ civilianPerception + armyPerception + percentCivilianGlassesWearers + redCrossPerception + civilianPerception * percentCivilianGlassesWearers, data=t)
summary(fit)