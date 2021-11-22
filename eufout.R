eufout <- function(x, file.name = "Rout.euf") {
    c("Sz_ért", "T", "B", "SZ_B", "SZ_T", "Felesleg", "Hiány", "Plusz")
    full.mat <- cbind(Ini = "[Sz]",
                      Szé = "<Sz_ért>",
                      x[,1],
                      T = "<T>",
                      x[,2],
                      B = "<B>",
                      x[,3],
                      SZB = "<SZ_B>",
                      x[,4],
                      SZT = "<SZ_T>",
                      x[,5],
                      Fleg = "<Felesleg>",
                      x[,6],
                      Hi = "<Hiány>",
                      x[,7],
                      Pl = "<Plusz>",
                      x[,8])
    asc.out <- sub("\\.", ",", full.mat)
    write(t(asc.out), file.name)
}
