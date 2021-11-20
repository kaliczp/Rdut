eufin <- function(file) {
    raw <- scan(file, what = character(), enc = "latin1")
    first.row <- raw[1:7]
    raw.nofirst <- raw[-(1:7)]
    raw.nofirst.mat <- matrix(raw.nofirst, ncol = 17, byrow = TRUE)
    raw.nofirst.mat.csak <- raw.nofirst.mat[,c(3,5,7,9,11,13,15,17)]
    sub(",",".",raw.nofirst.mat.csak)
}
