library(MASS)

?Boston
names(Boston)
head(Boston)

# Resultados iniciais
Boston.lm1 <- lm(Boston$medv ~ Boston$zn +Boston$indus +Boston$chas + Boston$nox +  Boston$rm +Boston$age +  Boston$dis +Boston$rad +  Boston$tax +  Boston$ptratio + Boston$black +Boston$lstat +Boston$crim);
summary(Boston.lm1);

# Melhores resultados
Boston.lm2 <- lm(Boston$medv ~ Boston$zn + Boston$chas + Boston$nox +  Boston$rm +  Boston$dis +Boston$rad +  Boston$tax +  Boston$ptratio + Boston$black +Boston$lstat +Boston$crim);
summary(Boston.lm2);

# Remocao dos outliers
par(mfrow=c(1, 1))
cooksd <- cooks.distance(Boston.lm2)
Boston$cooksd <- cooks.distance(Boston.lm2)

plot(cooksd, pch="*", cex=2, main="Influential Obs by Cooks distance")  # plot cook's distance
abline(h = 4*mean(cooksd, na.rm=T), col="red")  # add cutoff line
text(x=1:length(cooksd)+1, y=cooksd, labels=ifelse(cooksd>4*mean(cooksd, na.rm=T),names(cooksd),""), col="red")  # add labels

Boston$outlier <- ifelse(Boston$cooksd < 4/nrow(Boston), "keep","delete");
Boston2 <- Boston[Boston$outlier == "keep",]

Boston.lm3 <- lm(Boston2$medv ~ Boston2$zn + Boston2$chas + Boston2$nox +  Boston2$rm +  Boston2$dis + Boston2$rad +  Boston2$tax + Boston2$ptratio + Boston2$black + Boston2$lstat + Boston2$crim);
summary(Boston.lm3);

par(mfrow=c(2, 1))
scatter.smooth(y=residuals(Boston.lm3), x=fitted(Boston.lm3),  main="Boston")

fitted(Boston.lm3)
residuals(Boston.lm3)
scatter.smooth(y=residuals(Boston.lm3), x=fitted(Boston.lm3),  main="Boston")

