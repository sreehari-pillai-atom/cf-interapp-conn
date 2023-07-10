# How to RUN !

There are 2 CAP based micro services in this repository  **master-data** and **order-app**.  Execution scenario is as follows. 

- To read any entity sets from **master-data** service , user must have a scope assigned to him . Scope name is **masterdata-read** .
>  Refer the file master-data/srv/Service.cds where this scope control is implemented. 
- **Order-app** is open to access , which means the caller(user) does not need to have any scope assigned to his id.
- Both the application users different instances of xsuaa services 
- If you have a look into the **xs-security.json**  files in these projects, nothing related to granting scope to other apps mentioned . Its still as plain as a normal app running standalone.  

## Creating a destination to master-data
Create a destination in the sub-account where these applications are deployed with the name **MasterData** . 

| Name | Value |
|--|--|
| Name |MasterData  |
| URL |< url of srv instace of masterdata >  |
|Proxy Type|Internet|
|Authentication|OAuth2UserTokenExchange|
|Client ID|< take from xsuaa of master data>|
|Client Secret|< take from xsuaa of master data>|
|Token Service URL:|< take from xsuaa > - ends with /oauth/token|

> you need to create a service key for the xsuaa service of master-data to fetch client id and client secret
## How to test 

- Create a role collection **master-data-role** and assign **masterdata-read** scope to it. 
- Do not assign role to any user. 
- Run the app router URL of order-app. Run **< url >/order/Customers**
- You would get an error liek below
> Error during request to remote service: Forbidden 
- this is because , the user is missing the scope masterdata-read 
- Assign the created role collection to the user 
- Logoff from the browser and rerun the url 
- you will get the data from master-data app from order-app 
- That , my friend, is called, "inter app communication" 