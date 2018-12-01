Attribute VB_Name = "Module1"
Option Explicit


Sub Trendline()

Dim DMA As Integer



'Checking DMA Selection'
If Range("MA").Value = 1 Then
    DMA = 50
ElseIf Range("MA").Value = 2 Then
    DMA = 100
ElseIf Range("MA").Value = 3 Then
    DMA = 200
Else: DMA = 99

End If


'Clearing any existing Trendline'
ActiveSheet.ChartObjects("Time Series").Activate

On Error Resume Next
    ActiveChart.FullSeriesCollection(1).Trendlines(1).Select
On Error Resume Next
    ActiveChart.SetElement (msoElementTrendlineNone)
    
    Range("K18").Activate


'If None is Selected then do not add Moving Average Line'
If DMA = 99 Then
    Exit Sub
End If



'Adding Moving Average Line'
ActiveSheet.ChartObjects("Time Series").Activate
    ActiveChart.FullSeriesCollection(1).Trendlines.Add
    ActiveChart.FullSeriesCollection(1).Trendlines(1).Select
    With Selection
        .Type = xlMovingAvg
        .Period = DMA
        .DisplayEquation = True
    End With
    
    With Selection.Format.Line
        .Visible = msoTrue
        .ForeColor.ObjectThemeColor = msoThemeColorText1
        .ForeColor.TintAndShade = 0
        .ForeColor.Brightness = 0
        .Transparency = 0
    End With
    
    Range("K18").Activate
    
    
    
        
    
    
    
End Sub




Sub ComboBox_Change()

Select Case Application.Sheets("Time Series").Range("MA")
Case 1
    Call Trendline
Case 2
    Call Trendline
Case 3
    Call Trendline
Case 4
    Call Trendline
End Select
    
End Sub

