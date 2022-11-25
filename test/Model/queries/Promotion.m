let
    Source = Access.Database(File.Contents("C:\Users\owend\Documents\ContosoSalesV31_64bit.accdb")),
    _DimPromotion = Source{[Schema="",Item="DimPromotion"]}[Data],
    #"Removed Columns" = Table.RemoveColumns(_DimPromotion,{"PromotionDescription", "PromotionType", "PromotionCategory", "MinQuantity", "MaxQuantity", "ETLLoadID", "LoadDate", "UpdateDate"})
in
    #"Removed Columns"