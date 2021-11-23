test <- eufin("test.euf")
eufout(test)

## grep "[BT]:" FoldtomOri.dxf > btori.txt
## grep "[0-9]+[0-9]" FoldtomOri.dxf > szelvori.txt
## grep "[BT]:" FoldJavb23.dxf > btjav.txt
## grep "[0-9]+[0-9]" FoldJavb23.dxf > szelv.txt

szelv <- scan("szelv.txt", character(), sep = "\n")
btjav <- scan("btjav.txt", character(), sep = "\n")

cbind(szelv, matrix(btjav, ncol =2, byrow = TRUE))
