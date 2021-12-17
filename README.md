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
## Models 📋
* User
```
id: integer
username: string
password: string
token: string
```
* Enterprise
```
id: integer
name: string
nacionality: string
idUser: interger (1-->1)
```

* Candidate
```
id: integer
name: string
lastname: string
birth_date: fate
observations: string
idUser: integer (1-->1)
```

* Jobs
```
id: integer
name: string
description: string
requirements: string
time: string
enable: boolean
idEnterprise: interger (N-->1)
```
* Subcriptions
```
id: integer
state: string
idJob: integer (N-->1)
idCandidate: integer (N-->1)
```

# Endpoints  📄 


Response error for all enpoint 
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



# USER
###  Create User
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


Example curl
```
curl -i -H "Content-Type:application/json" -X POST http://127.0.0.1:3000/v1/users -d '{"username":"csirfranco","password":"123456789"}'
```

### Login User
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

Example curl
```
curl -i -H "Authorization:bearer xFWHKBZJrsAqb9C9CSwKrA" -X GET http://127.0.0.1:3000/v1/users/logout
```
#
## ENTERPRISE
###  Index Enterprise
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

Example Curl
```
curl -i -H "Authorization:bearer SP_X1tSH4KKEUE72xFqHSw" -H "Content-Type:application/json" -X GET http://127.0.0.1:3000/v1/enterprises
```

###  Create Enterprise
* _POST v1/enterprises_  
 
``` 
Authorization: bearer token
```

Body
```
{
    "name":"string",
    "nationality":"string"
}
```

Response sucess
```
HTTP/1.1 200

{
    "id: integer
    "name":"string",
    "nationality":"string"
}

```

Example Curl
```
url -i -H "Authorization:bearer lka-YmS4T3b38XijU_NCLw" -H "Content-Type:application/json" -X POST http://127.0.0.1:3000/v1/enterprises -d '{"name":"w3SchoolS.A","nationality":"Argentina"}'
```

###  Update Enterprise
* _PUT v1/enterprises/:id_  
 
``` 
Authorization: bearer token
```

Body
```
{
    "name":"string",
    "nationality":"string"
}
```
Response sucess
```
HTTP/1.1 200
{
    "id: integer
    "name":"string",
    "nationality":"string"
}


```
Example curl 

```
curl -i -H "Authorization:bearer lka-YmS4T3b38XijU_NCLw" -H "Content-Type:application/json" -X PUT http://127.0.0.1:3000/v1/enterprises/2 -d '{"name":"Carefur","nationality":"France"}'
```


#
## CANDIDATE
###  Index Candidate
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


Example Curl
```
curl -i -H "Authorization:bearer SP_X1tSH4KKEUE72xFqHSw" -H "Content-Type:application/json" -X GET http://127.0.0.1:3000/v1/cantidadates
```
###  Create Candidate
* _POST v1/candidates_  
 
``` 
Authorization: bearer token
```

Body
```
{
    "name":"string",
    "lasname":"string",
    "birth_date":date,
    "observations" string

    }
```

Response sucess
```
HTTP/1.1 200
{
    "id": integer,
    "name":"string",
    "lasname":"string",
    "birth_date":date,
    "observations": "string"

    }

```

Example Curl
```
curl -i -H "Authorization:bearer SP_X1tSH4KKEUE72xFqHSw" -H "Content-Type:application/json" -X POST http://127.0.0.1:3000/v1/candidates -d '{"name":"Lionel","lasname":"Messi","birth_date":09/09/1995}'
```

###  Update Candidate
* _PUT v1/candidates/:id_  
 
``` 
Authorization: bearer token
```

Body
```
{
    "name":"string",
    "lasname":"string",
    "birth_date":date,
    "observations" string

    }
```
Response sucess
```
HTTP/1.1 200
{
    "id": id,
    "name":"string",
    "lasname":"string",
    "birth_date":date,
    "observations": "string"

    }

```
Example curl 

```
curl -i -H "Authorization:bearer SP_X1tSH4KKEUE72xFqHSw" -H "Content-Type:application/json" -X PUT http://127.0.0.1:3000/v1/candidates/2 -d '{"name":"Leo","lastname":"sutter","bith_date":"10/10/21","observations":"soy alumno de la utn"}'
```

#
## JOB
###  Index Job
* _get v1/jobs_  
for enterprises and candidates 
``` 
Authorization: bearer token
```

Response sucess
```
HTTP/1.1 200

[{
   "id": "integer",
   "name": "string",
   "description": "string",
   "requirements": "string",
    "time": "string",
    "enable": "boolean"
}]

```

Example Curl
```
url -i -H "Authorization:bearer jVrQH9QxzBD_jv4CeZDQIg" -X GET http://127.0.0.1:3000/v1/jobs
```

###  Show Job
* _get v1/jobs/:id_  
 
``` 
Authorization: bearer token
```

Response sucess
```
HTTP/1.1 200

{
   "id": "integer",
   "name": "string",
   "description": "string",
   "requirements": "string",
    "time": "string",
    "enable": "boolean"
}

```

Example Curl
```
url -i -H "Authorization:bearer jVrQH9QxzBD_jv4CeZDQIg" -X GET http://127.0.0.1:3000/v1/jobs/1
```

###  Create Job
* _POST v1/jobs_  
 
``` 
Authorization: bearer token
```

Body
```
{
   "name": "string",
   "description": "string",
   "requirements": "string",
   "time": "string",
   "enable": "boolean"
}
```

Response sucess
```
HTTP/1.1 200
{
   "id": "integer",
   "name": "string",
   "description": "string",
   "requirements": "string",
    "time": "string",
    "enable": "boolean"
}

```

Example Curl
```
curl -i -H "Authorization:bearer jVrQH9QxzBD_jv4CeZDQIg" -H "Content-Type:application/json" -X POST http://127.0.0.1:3000/v1/jobs -d '{"name":"DevelomentJunior","description":"Desarrollador junior de rails para una propuesta interesente de trabajo. Sueldo a discutir","requirements":"estudiante de Ing en sistemas o carreras a fines", "time":"parttime"}'
```
###  Update Job
* _PUT v1/job/:id_  
 
``` 
Authorization: bearer token
```

Body
```
{
   "name": "string",
   "description": "string",
   "requirements": "string",
   "time": "string",
   "enable": "boolean"
}
```
Response sucess
```
HTTP/1.1 200
{
   "id": "integer",
   "name": "string",
   "description": "string",
   "requirements": "string",
    "time": "string",
    "enable": "boolean"
}

```
Example curl 

```
curl -i -H "Authorization:bearer jVrQH9QxzBD_jv4CeZDQIg" -H "Content-Type:application/json" -X PUT http://127.0.0.1:3000/v1/jobs/1 -d '{"name":"DevelomentJunior","description":"Desarrollador junior de rails para una propuesta interesente de trabajo. Sueldo en dolares","requirements":"estudiante de Ing en sistemas o carreras a fines", "time":"fulltime"}'
```
#

## Subscriptions
###  Index Subscriptions
* _get v1/subscriptions_  
 
``` 
Authorization: bearer token
```

Response sucess
```
HTTP/1.1 200


[{
    "job": {
        "name": "string",
        "description": "string",
        "requirements": "string",
        "time": "string",
        "enable": "boolean"
    },
    "state": "string"
}]


```

Example curl
```
url -i -H "Authorization:bearer EcXrGzBczIjMkFr6Hq-ARA" -X GET http://127.0.0.1:3000/v1/subscriptions
```


###  Show Subscriptions
* _get v1/subscriptions/:id_  
 
``` 
Authorization: bearer token
```

Response sucess
```
HTTP/1.1 200

{
    "job": {
        "name": "string",
        "description": "string",
        "requirements": "string",
        "time": "string",
        "enable": "boolean"
    },
    "state": "string"
}

```

Example Curl
```
url -i -H "Authorization:bearer jVrQH9QxzBD_jv4CeZDQIg" -X GET http://127.0.0.1:3000/v1/subscriptions/1
```


###  Create Subcriptions
* _POST v1/subscriptions_  
 
``` 
Authorization: bearer token
```

Body
```
{
   "job_id":interger
}
```

Response sucess
```
HTTP/1.1 200

{
    "job": {
        "name": "string",
        "description": "string",
        "requirements": "string",
        "time": "string",
        "enable": "boolean"
    },
    "state": "string"
}

```

Example Curl

```
curl -i -H "Authorization:bearer cXrGzBczIjMkFr6Hq-ARA" -H "Content-Type:application/json" -X POST http://127.0.0.1:3000/v1/subscriptions -d '{"job_id":"1"}'
```