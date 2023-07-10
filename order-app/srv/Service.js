const cds = require("@sap/cds");
module.exports = cds.service.impl(async function (srv) {
    const MasterData = await cds.connect.to("MasterData");
    this.on("READ" , ["Customers" , "Products" ] , async (req,res)=>{
        return MasterData.run(SELECT.from(req.entity).where(req.query));
    });
});