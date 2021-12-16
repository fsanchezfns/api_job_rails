# API - JOB 

_description de la api_


#
## Configurations 🔧

* Database creation
```
rails db:create
```
```
rails db:migrate
```
* run server:
```
rails s
```

#
## Model 📋
* User
```
username: string
password: string
token: string
```
* Enterprise
```
name: string
nacionality: string
```

#
# Endpoints  📄 

##  Create User
* _POST v1/users_  
 
Body
```
{
"username":"string",
"password":"pass"
}
```
Response sucess
```
HTTP/1.1 200

{
"username":"string"
}
```

Response error
```
HTTP/1.1 400

{
"messages":[
        {
            descriptions:["desc1","desc2"]
        }
    ]
}
```

Example curl
```
curl -i -H "Content-Type:application/json" -X POST http://127.0.0.1:3000/v1/users -d '{"username":"csirfranco","password":"123456789"}'
```

## Login User
* _POST v1/users/login_  

Body
```
{
"username":"string",
"password":"pass"
}
```
Response sucess
```
HTTP/1.1 200

{
"token":"string"
}
```

Response error
```
HTTP/1.1 400

{
"messages":[
        {
            descriptions:["desc1","desc2"]
        }
    ]
}
```

Example curl
```
curl -i -H "Content-Type:application/json" -X POST http://127.0.0.1:3000/v1/users/login -d '{"username":"csirfranco","password":"123456789"}'
```
