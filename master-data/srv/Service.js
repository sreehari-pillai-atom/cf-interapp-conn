const cds = require("@sap/cds");
module.exports = cds.service.impl(async function (srv) {
    this.on("orderPlaced", async (req, res, next) => {
        let {
            CustomerId,
            ProductId,
            OrderQuantity
        } = req.data.data;

        //get current stock 
        let product = await SELECT.one().from('db.md.Product').byKey(ProductId);
        if (product.Stock - OrderQuantity < 0) {
            return false;
        }
        else {
            await UPDATE.entity('db.md.Product').set({
                Stock: product.Stock - OrderQuantity
            }).where({
                ID: ProductId
            });
        }
        return true;

    });


    this.on(
        "loadInitialData",
        async (req, res, next) => {
            const northwind = await cds.connect.to("northwind");
            let products = await northwind.get("/Products?$format=json");
            let customers = await northwind.get("/Customers?$format=json");

            let productsMap = products.d.results.map((p)=>{
                return {
                    Name : p.ProductName ,
                    Price : p.UnitPrice ,
                    Currency : 'USD' ,
                    Stock : parseInt(p.UnitsInStock)
                }
            }) ;

            let customersMap = customers.d.results.map((c)=>{
                return {
                    Name : c.CompanyName ,
                    Address : {
                        Street : c.Address,
                        Building : '',
                        Country : c.Country ,
                        Pincode : String(c.PostalCode).substring(0,6)
                    }
                }
            });

            await INSERT.into('db.md.Product').entries(productsMap);
            await INSERT.into('db.md.Customer').entries(customersMap);

            return true;


        }
    )

});