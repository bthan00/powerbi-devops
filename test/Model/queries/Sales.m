let
    Source = Access.Database(File.Contents("C:\Users\owend\Documents\ContosoSalesV31_64bit.accdb")),
    _FactSales = Source{[Schema="",Item="FactSales"]}[Data],
    #"Removed Columns" = Table.RemoveColumns(_FactSales,{"CurrencyKey", "ETLLoadID", "LoadDate", "UpdateDate"})
in
    #"Removed Columns"