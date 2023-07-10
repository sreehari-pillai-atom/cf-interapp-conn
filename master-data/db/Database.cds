namespace db.md;

using { cuid , managed } from '@sap/cds/common';

type Currency : String(3);

type Address {
    Street : String(100) ;
    Building : String(100) ;
    Country : String(50) ;
    Pincode : String(6) ;
};


entity Customer : cuid , managed {
    Name : String(100); 
    Address : Address ;
}

entity Product : cuid , managed { 
    Name : String(100);
    Price : Decimal(20,5);
    Currency : String(3) ;
    Stock : Integer ; 
};

