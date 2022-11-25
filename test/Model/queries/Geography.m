let
    Source = Access.Database(File.Contents("C:\Users\owend\Documents\ContosoSalesV31_64bit.accdb")),
    _DimGeography = Source{[Schema="",Item="DimGeography"]}[Data],
    #"Removed Columns" = Table.RemoveColumns(_DimGeography,{"ETLLoadID", "LoadDate", "UpdateDate"})
in
    #"Removed Columns"