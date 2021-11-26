eufcalc <- function(x) {
    xout <- x
    dist <- diff(x$Sz_ért)
    xout$SZ_T <- round(c(0, (x[-1, "T"] + x[-nrow(x), "T"])/2 * dist * 1.1))
    xout$SZ_B <- round(c(0, (x[-1, "B"] + x[-nrow(x), "B"])/2 * dist))
    xout$Felesleg <- xout$SZ_B - xout$SZ_T
    xout$Hiány[xout$Felesleg < 0] <- abs(xout$Felesleg[xout$Felesleg < 0])
    xout$Felesleg[xout$Felesleg < 0] <- 0
    xout
}
