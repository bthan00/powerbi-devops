let
    Source = Access.Database(File.Contents("C:\Users\owend\Documents\ContosoSalesV31_64bit.accdb")),
    _DimProductCategory = Source{[Schema="",Item="DimProductCategory"]}[Data],
    #"Removed Columns" = Table.RemoveColumns(_DimProductCategory,{"ProductCategoryLabel", "ETLLoadID", "LoadDate", "UpdateDate", "ProductCategoryDescription"}),
    #"Renamed Columns" = Table.RenameColumns(#"Removed Columns",{{"ProductCategoryName", "ProductCategory"}})
in
    #"Renamed Columns"