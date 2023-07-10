
using { db.md as db } from '../db/Database';

type OrderInformation{
    CustomerId : UUID;
    ProductId : UUID ;
    OrderQuantity : Integer ;
}

@(requires: 'masterdata-read')
service MasterDataService {
    entity Customers as projection on db.Customer ;
    entity Products as projection on db.Product;
    @(requires:'place-order')
    action orderPlaced( data : OrderInformation ) returns Boolean ;

    function loadInitialData() returns Boolean ;
}