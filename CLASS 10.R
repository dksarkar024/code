library(dLagM)
data("seaLevelTempSOI")
dat=seaLevelTempSOI
#yt=yt-1+yt-2+...+xt-1+xt-2+...+et

?ardlDlm
#q will depend on y, p will depend on x

mod<-ardlDlm(GMSL~LandOcean+SOI, p=5, q=5, data=dat)
summary(mod) #x significant at lag=2, tai 3,4,5 baad dilam


mod<-ardlDlm(GMSL~LandOcean+SOI, p=3, q=5, data=dat)
summary(mod)


mod<-ardlDlm(GMSL~LandOcean+SOI, p=2, q=5, data=dat)
summary(mod)
rm=list(p=list(LandOcean=c(1))) #q o remove korte chaile rm=list(p=list(LandOcean=c(1)),q=list(GMSL=c(2)))
mod2=ardlDlm(GMSL~LandOcean, p=2, q=5, remove=rm, data=dat)
summary(mod2)

#if we want to forecast this model, next year er sea level will depend on next year er temp and tar ager sea level er temp
x=matrix(c(0.07), nrow=1) #temp er value next year er
forecast(mod2, x=x) #forecasted value of sealevel for current year


x=matrix(c(0.07, 0.06), nrow=1) #temp er value jodi 2ta thakto
forecast(mod2, x=x, h=2) #h=2 means current time and tar 1 year later
