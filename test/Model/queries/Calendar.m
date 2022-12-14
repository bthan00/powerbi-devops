let
    Source = Access.Database(File.Contents("C:\Users\owend\Documents\ContosoSalesV31_64bit.accdb")),
    _DimDate = Source{[Schema="",Item="DimDate"]}[Data],
    #"Changed Type" = Table.TransformColumnTypes(_DimDate,{{"YearKey", Int64.Type}, {"QuarterOfYear", Int64.Type}, {"MonthOfYear", Int64.Type}, {"DayOfMonth", Int64.Type}}),
    #"Removed Columns" = Table.RemoveColumns(#"Changed Type",{"MonthInCalendar", "QuarterInCalendar", "DayInWeek"}),
    #"Renamed Columns" = Table.RenameColumns(#"Removed Columns",{{"YearKey", "Year"}})
in
    #"Renamed Columns"