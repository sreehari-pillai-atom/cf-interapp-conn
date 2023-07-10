namespace db.order;

using { cuid , managed  } from '@sap/cds/common';
type Currency : String(3);

entity OrderHeader : cuid , managed {
    CustomerId : UUID ; //customer ID from external Application
    OrderValue : Decimal(20,5);
    Currency : Currency default 'USD';
    DeliveryDate : Date null;
    ItsItems : Association to many OrderItems on 
               ItsItems.OrderId = $self.ID ; 
} ;

entity OrderItems : cuid , managed{
    OrderId : UUID ;
    ProductId : UUID ;// Product ID from external Application
    Quantity : Integer ;
    UnitPrice : Decimal(20,5);
    Currency : Currency default 'USD';
    OrderValue : Decimal(20,5);
    ItsOrder : Association to one OrderHeader on 
               ItsOrder.ID = $self.OrderId ;
};
