' Const A = True

' If A Then
'     Print "Hi!"
' End If
' Print "Ha!"

Type Place
    name As String
    population As Integer
End Type

Type Placer
    ' name As String
    a As Integer
    population As Integer
End Type

Dim places(1) As Placer => { _
    (1, 2) _
    _ ' ("Río Blanco", 829), _
    _ ' ("San Marcos", 47063) _
}
    ' {},
    ' {},
' }
'   {.name = "Río Blanco", .population = 829},
'   {.name = "San Marcos", .population = 47063},
'   {.name = "Xela", .population = 180706},

Sub Main
    Dim b as String => "A"
    Dim blah as Place
    blah.name = "Whatever"
    blah.population = 5
    Print "Hi!"
    Print blah.name
End Sub

Main
