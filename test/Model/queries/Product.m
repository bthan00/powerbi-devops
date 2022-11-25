let
    Source = Access.Database(File.Contents("C:\Users\owend\Documents\ContosoSalesV31_64bit.accdb")),
    _DimProduct = Source{[Schema="",Item="DimProduct"]}[Data],
    #"Reordered Columns" = Table.ReorderColumns(_DimProduct,{"ProductKey", "ProductName", "ProductSubcategoryKey", "Manufacturer", "BrandName", "ClassName", "ProductLabel", "ProductDescription", "ClassID", "StyleID", "StyleName", "ColorID", "ColorName", "Size", "SizeRange", "SizeUnitMeasureID", "Weight", "WeightUnitMeasureID", "UnitOfMeasureID", "UnitOfMeasureName", "StockTypeID", "StockTypeName", "UnitCost", "UnitPrice", "AvailableForSaleDate", "StopSaleDate", "Status", "ImageURL", "ProductURL", "ETLLoadID", "LoadDate", "UpdateDate"}),
    #"Removed Other Columns" = Table.SelectColumns(#"Reordered Columns",{"ProductKey", "ProductName", "ProductSubcategoryKey", "Manufacturer", "BrandName", "ClassName", "ProductDescription", "UnitCost", "UnitPrice"})
in
    #"Removed Other Columns"