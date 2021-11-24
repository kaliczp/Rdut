test <- eufin("test.euf")
eufout(test)

## grep "[BT]:" FoldtomOri.dxf > btori.txt
## grep "[0-9]+[0-9]" FoldtomOri.dxf > szelvori.txt
## grep "[BT]:" FoldJavb23.dxf > btjav.txt
## grep "[0-9]+[0-9]" FoldJavb23.dxf > szelv.txt

szelv <- scan("szelv.txt", character(), sep = "\n")
btjav <- scan("btjav.txt", character(), sep = "\n")

clean.fold <- function(c.id, vol) {
    c.id.split <- unlist(strsplit(c.id, " "))
    c.id.nospace <- c.id.split[!(c.id.split == "")]
    c.id.only <- c.id.nospace[grep("\\+", c.id.nospace)]
    c.id.noplus <- sub("\\+", "", c.id.only)
    c.id.ok <- as.numeric(sub(",", ".", c.id.noplus))
    vol.clean <- sub("[BT]: ","", vol)
    vol.num <- as.numeric(sub(",",".",vol.clean))
    vol.ok <- matrix(vol.num, ncol =2, byrow = TRUE)
    T.clean <- vol.ok[,1]
    B.clean <- vol.ok[,2]
    vol.table <- data.frame(id = c.id.ok, T = T.clean, B = B.clean)
    vol.table[order(vol.table[,"id"]),]
}

write.table(clean.fold(szelv, btjav), "table.txt", sep = "\t", quote=F, row.names = F, dec=",")

ok <- read.table("tablejo.csv", sep="\t", head = TRUE)
okfull <- cbind(ok[,1:3],0,0,0,0,0)
colnames(okfull) <- colnames(test)
eufout(okfull)
