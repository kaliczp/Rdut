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
    vol.ok <- matrix(vol, ncol =2, byrow = TRUE)
    vol.table <- data.frame(id = c.id.ok, T = vol.ok[,1], B = vol.ok[,2])
    vol.table[order(vol.table[,"id"]),]
}

clean.fold(szelv, btjav)
