/* checksum : 2a9ac025e67f3068058db1c306b1081b */
@cds.external : true
function MasterData.loadInitialData() returns Boolean;

@cds.external : true
action MasterData.orderPlaced(
  data : MasterData.OrderInformation
) returns Boolean;

@cds.external : true
@cds.persistence.skip : true
entity MasterData.Customers {
  key ID : UUID not null;
  @odata.Precision : 7
  @odata.Type : 'Edm.DateTimeOffset'
  @UI.HiddenFilter : true
  @Core.Immutable : true
  @Core.Computed : true
  @Common.Label : 'Created On'
  createdAt : Timestamp;
  /** User's unique ID */
  @UI.HiddenFilter : true
  @Core.Immutable : true
  @Core.Computed : true
  @Common.Label : 'Created By'
  createdBy : String(255);
  @odata.Precision : 7
  @odata.Type : 'Edm.DateTimeOffset'
  @UI.HiddenFilter : true
  @Core.Computed : true
  @Common.Label : 'Changed On'
  modifiedAt : Timestamp;
  /** User's unique ID */
  @UI.HiddenFilter : true
  @Core.Computed : true
  @Common.Label : 'Changed By'
  modifiedBy : String(255);
  Name : String(100);
  Address_Street : String(100);
  Address_Building : String(100);
  Address_Country : String(50);
  Address_Pincode : String(6);
};

@cds.external : true
@cds.persistence.skip : true
entity MasterData.Products {
  key ID : UUID not null;
  @odata.Precision : 7
  @odata.Type : 'Edm.DateTimeOffset'
  @UI.HiddenFilter : true
  @Core.Immutable : true
  @Core.Computed : true
  @Common.Label : 'Created On'
  createdAt : Timestamp;
  /** User's unique ID */
  @UI.HiddenFilter : true
  @Core.Immutable : true
  @Core.Computed : true
  @Common.Label : 'Created By'
  createdBy : String(255);
  @odata.Precision : 7
  @odata.Type : 'Edm.DateTimeOffset'
  @UI.HiddenFilter : true
  @Core.Computed : true
  @Common.Label : 'Changed On'
  modifiedAt : Timestamp;
  /** User's unique ID */
  @UI.HiddenFilter : true
  @Core.Computed : true
  @Common.Label : 'Changed By'
  modifiedBy : String(255);
  Name : String(100);
  Price : Decimal(20, 5);
  Currency : String(3);
  Stock : Integer;
};

@cds.external : true
type MasterData.OrderInformation {
  CustomerId : UUID;
  ProductId : UUID;
  OrderQuantity : Integer;
};

@cds.external : true
service MasterData {};

