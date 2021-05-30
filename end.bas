Type Place
    name As String
    population As Integer
End Type

Sub Main
    Dim places(0 To 2) As Place
    places(0).name = "Río Blanco"
    places(0).population = 829
    places(1).name = "San Marcos"
    places(1).population = 47063
    places(2).name = "Xela"
    places(2).population = 180706

    Print places(2).name
End Sub

Main
