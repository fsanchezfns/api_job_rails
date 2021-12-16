# API - JOB 

_description de la api_


#
## Configurations 🔧

* Database creation and init
```
rails db:create db:migrate db:seed
```

* Database drop + creation and init
```
rails db:drop db:create db:migrate db:seed
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


# Endpoints  📄 

# USER
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
curl -i -H "Content-Type:application/json" -X POST http://127.0.0.1:3000/v1/users/login -d '{"username":"franco","password":"123456789"}'
```
## Logout User
* _GET v1/users/logout_

``` 
Authorization: bearer token
```
Response sucess
```
HTTP/1.1 200

logout OK!

```

Response error
```
response er
```


Example curl
```
curl -i -H "Authorization:bearer xFWHKBZJrsAqb9C9CSwKrA" -X GET http://127.0.0.1:3000/v1/users/logout
```
#
# ENTERPRISE
##  Index Enterprise
* _get v1/enterprises_  
 
``` 
Authorization: bearer token
```

Response sucess
```
HTTP/1.1 200

{
    "name":"string",
    "nationality":"string"
}

```
# 


`
#
# CANDIDATE
##  Index Candidate
* _get v1/candidates_  
 
``` 
Authorization: bearer token
```

Response sucess
```
HTTP/1.1 200

{
    "name":"string",
    "lastname":"string",
    "birth_date":"date",
    "observations":"string"
}

```
##  Register Candidate
* _POST v1/candidates_  
 
``` 
Authorization: bearer token
```

```
curl -i -H "Authorization:bearer SP_X1tSH4KKEUE72xFqHSw" -H "Content-Type:application/json" -X POST http://127.0.0.1:3000/v1/candidates -d '{"name":"Lionel","lasname":"Messi","birth_date":09/09/1995}'
```
# 

