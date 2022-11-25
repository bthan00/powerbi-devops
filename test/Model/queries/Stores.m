let
    Source = Access.Database(File.Contents("C:\Users\owend\Documents\ContosoSalesV31_64bit.accdb")),
    _DimStores = Source{[Schema="",Item="DimStores"]}[Data],
    #"Removed Columns" = Table.RemoveColumns(_DimStores,{"StoreManager", "CloseDate", "OpenDate", "ZipCode", "ZipCodeExtension", "StorePhone", "StoreFax", "AddressLine1", "AddressLine2", "LastRemodelDate", "GeoLocation", "Geometry", "ETLLoadID", "LoadDate", "UpdateDate", "EntityKey", "StoreDescription"})
in
    #"Removed Columns"