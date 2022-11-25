let
    Source = Access.Database(File.Contents("C:\Users\owend\Documents\ContosoSalesV31_64bit.accdb")),
    _DimChannel = Source{[Schema="",Item="DimChannel"]}[Data],
    #"Removed Columns" = Table.RemoveColumns(_DimChannel,{"ETLLoadID", "LoadDate"}),
    #"Renamed Columns" = Table.RenameColumns(#"Removed Columns",{{"ChannelKey", "Channel"}}),
    #"Removed Columns1" = Table.RemoveColumns(#"Renamed Columns",{"ChannelLabel", "ChannelDescription", "UpdateDate"})
in
    #"Removed Columns1"