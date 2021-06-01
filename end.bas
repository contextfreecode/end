Declare Sub Split( _
    result() As String, _
    ByRef text As Const String, _
    ByRef cut As Const String _
)

Sub Tally(fileNum as Long)
    Dim text As String
    Do Until Eof(fileNum)
        Line Input #fileNum, text
        Dim fields() As String
        Split(fields(), text, !"\t")
        Var latitude = Val(fields(4))
        Dim population As LongInt = ValInt(fields(14))
        Print latitude, population
    Loop
End Sub

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

Sub Main
    Var fileName = Command(1)
    Var fileNum = FreeFile()
    If Len(fileName) = 0 Then
        Error 1
    End If
    Open fileName For Input As #fileNum
    If Err > 0 Then
        Error 1
    End If
    Tally(fileNum)
    Close #fileNum
End Sub

Main
