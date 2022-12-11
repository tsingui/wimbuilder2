Dim f, b, n
Dim teststr
teststr = "test123"  'should better be in 7 bytes
f = Split(";30;31;32;33;34;35;36;37;90;91;92;93;94;95;96;97", ";")
b = Split(";40;41;42;43;44;45;46;47;100;101;102;103;104;105;106;107", ";")
n = Split("Black;Red;Green;Yellow;Blue;Magenta;Cyan;Lgray;" + _
          "Dark gray;Lred;Lgreen;Lyellow;Lblue;Lmagenta;Lcyan;White", ";")

WSH.echo "\033[97;104mCMDCOLOR \033[97;105mTABLE"
Dim i, j, k, colorstr
For i = 0 To 16
  For j = 0 To 16
    colorstr = colorstr & colorcode(f(i) , b(j), 1) & teststr
    k = k + 1
    If k mod 17 = 0 Then
      WSH.echo colorstr
      colorstr = ""
    End If
  Next
Next

WSH.echo vbCrLf & "\033[97;101mCOLOR \033[97;104mCODE"

For i = 0 To 16
  For j = 0 To 16
    colorstr = colorstr & colorcode(f(i) , b(j), 1) & Left(colorcode(f(i) , b(j), 0) & Space(10), 7)
    k = k + 1
    If k mod 17 = 0 Then
      WSH.echo colorstr
      colorstr = ""
    End If
  Next
Next


Function colorcode(fcode, bcode, withescape)
  If fcode = "" Then
    colorcode = bcode
  ElseIf bcode = "" Then
    colorcode = fcode
  Else
    colorcode = fcode & ";" & bcode
  End If
  If fcode = "" And bcode = "" Then colorcode = "0"
  If withescape = 1 Then 
    colorcode = "\033[" & colorcode & "m"
  Else
    colorcode = colorcode & "m"
  End If
End Function


