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
    c.id.ok <- c.id.nospace[grep("\\+", c.id.nospace)]
    vol.ok <- matrix(vol, ncol =2, byrow = TRUE)
    vol.table <- cbind(c.id.ok, vol.ok)
    vol.table[order(vol.table[,"c.id.ok"]),]
}

clean.fold(szelv, btjav)
