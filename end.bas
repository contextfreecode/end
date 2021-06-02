Sub Split( _
    result() As String, _
    ByRef text As Const String, _
    ByRef cut As Const String _
)
    Var cutLength = Len(cut)
    Var index = InStr(text, cut)
    Var count = 0
    Var start = 1
    While index > 0
        count += 1
        ReDim Preserve result(count)
        result(count - 1) = Mid(text, start, index - start)
        start = index + cutLength
        index = InStr(start, text, cut)
    Wend
    result(count) = Mid(text, start)
End Sub

Type Region
    name as String
    population as LongInt
    southEdge as Double
End Type

Sub Tally(fileNum as Long, regions() As Region)
    Dim text As String
    Do Until Eof(fileNum)
        Line Input #fileNum, text
        Dim fields() As String
        Split(fields(), text, !"\t")
        Var latitude = Val(fields(4))
        Dim population As LongInt = ValInt(fields(14))
        For index As Integer = LBound(regions) To UBound(regions)
            If latitude >= regions(index).southEdge Then
                regions(index).population += population
                Exit For
            End If
        Next index
    Loop
End Sub

Sub Main
    ' Define regions.
    Dim regions(0 To 1) as Region
    regions(0).name = "North"
    regions(0).population = 0
    regions(0).southEdge = 0
    regions(1).name = "South"
    regions(1).population = 0
    regions(1).southEdge = -90
    ' Open file.
    Var fileName = Command(1)
    Var fileNum = FreeFile()
    If Len(fileName) = 0 Then
        Error 1
    End If
    Open fileName For Input As #fileNum
    If Err > 0 Then
        Error 1
    End If
    ' Calculate and close.
    Tally(fileNum, regions())
    Close #fileNum
    ' Report.
    For index As Integer = LBound(regions) To UBound(regions)
        Print regions(index).name; regions(index).population
    Next index
End Sub

Main
