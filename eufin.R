eufin <- function(file) {
    raw <- scan(file, what = character(), enc = "latin1")
    raw <- sub(",", ".", raw)
    ## Procession of first row
    first.row <- raw[1:7]
    first.fullvect <- c(as.numeric(first.row[c(3,5,7)]), rep(0, 5))
    first.mat <- matrix(first.fullvect, nrow = 1, byrow = TRUE)
    ## Remainin part
    raw.nofirst <- raw[-(1:7)]
    raw.nofirst.mat <- matrix(raw.nofirst, ncol = 17, byrow = TRUE)
    raw.nofirst.mat.csak <- raw.nofirst.mat[,c(3,5,7,9,11,13,15,17)]
    data.mat <- apply(raw.nofirst.mat.csak, 2, as.numeric)
    data.mat <- rbind(first.mat, data.mat)
    colnames(data.mat) <- c("Sz_ért", "T", "B", "SZ_B", "SZ_T", "Felesleg", "Hiány", "Plusz")
    data.mat
}
