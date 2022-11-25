let
    Source = Access.Database(File.Contents("C:\Users\owend\Documents\ContosoSalesV31_64bit.accdb")),
    _DimProductSubcategory = Source{[Schema="",Item="DimProductSubcategory"]}[Data],
    #"Removed Columns" = Table.RemoveColumns(_DimProductSubcategory,{"ProductSubcategoryLabel", "ProductSubcategoryDescription", "ETLLoadID", "LoadDate", "UpdateDate"}),
    #"Renamed Columns" = Table.RenameColumns(#"Removed Columns",{{"ProductSubcategoryName", "ProductSubcategory"}})
in
    #"Renamed Columns"