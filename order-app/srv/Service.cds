using { db.order as db } from '../db/Database';

using {  MasterData } from './external/MasterData';


service OrderService {
    entity Orders as projection on db.OrderHeader ;
    entity OrderItems as projection on db.OrderItems;

    entity Customers as projection on  MasterData.Customers ;
    entity Products as projection on   MasterData.Products ;

}

