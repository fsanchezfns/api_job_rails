# API - JOB 

_api rest sobre una bolsa de trabajo_

* Registarse como compañía o candidato.
* Publicar un aviso de trabajo.
* Los candidatos pueden aplicar a ese trabajo.
* Administrar candidatos para los trabajos seleccionados: Interesa,
Rechazado,Contratado

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

* Job
```
id: integer
name: string
description: string
requirements: string
time: string
enable: boolean
idEnterprise: interger (N-->1)
```
* Subcription
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



# USER📌
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
curl -i -H "Content-Type:application/json" -X POST http://127.0.0.1:3000/v1/users/login -d '{"username":"csirfranco","password":"123456789"}'
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
## ENTERPRISE📌
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
curl -i -H "Authorization:bearer SP_X1tSH4KKEUE72xFqHSw"  -X GET http://127.0.0.1:3000/v1/enterprises
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
curl -i -H "Authorization:bearer lka-YmS4T3b38XijU_NCLw" -H "Content-Type:application/json" -X POST http://127.0.0.1:3000/v1/enterprises -d '{"name":"w3SchoolS.A","nationality":"Argentina"}'
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
## CANDIDATE📌
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
curl -i -H "Authorization:bearer SP_X1tSH4KKEUE72xFqHSw" -X GET http://127.0.0.1:3000/v1/candidates
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
curl -i -H "Authorization:bearer SP_X1tSH4KKEUE72xFqHSw" -H "Content-Type:application/json" -X POST http://127.0.0.1:3000/v1/candidates -d '{"name":"Lionel","lastname":"Messi","birth_date":"09/09/1995"}'
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
## JOB📌
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
curl -i -H "Authorization:bearer jVrQH9QxzBD_jv4CeZDQIg" -X GET http://127.0.0.1:3000/v1/jobs
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
curl -i -H "Authorization:bearer jVrQH9QxzBD_jv4CeZDQIg" -X GET http://127.0.0.1:3000/v1/jobs/1
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

## Subscriptions📌
###  Index Subscriptions
* _get v1/subscriptions_  
for candidate
``` 
Authorization: bearer token
```

Response sucess
```
HTTP/1.1 200


[{
    "id": integer
    "state": "string",
    "job": {
        "name": "string",
        "description": "string",
        "requirements": "string",
        "time": "string",
        "enable": "boolean"
    }
    
}]


```

Example curl
```
curl -i -H "Authorization:bearer EcXrGzBczIjMkFr6Hq-ARA" -X GET http://127.0.0.1:3000/v1/subscriptions
```


###  Show Subscriptions
* _get v1/subscriptions/:id_  
for candidate
``` 
Authorization: bearer token
```

Response sucess
```
HTTP/1.1 200

{
    "id": integer
    "state": "string",
    "job": {
        "name": "string",
        "description": "string",
        "requirements": "string",
        "time": "string",
        "enable": "boolean"
    }
    
}

```

Example Curl
```
curl -i -H "Authorization:bearer jVrQH9QxzBD_jv4CeZDQIg" -X GET http://127.0.0.1:3000/v1/subscriptions/1
```


###  Create Subcriptions
* _POST v1/subscriptions_  
for candidate 
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
    "id": integer
    "state": "string",
    "job": {
        "name": "string",
        "description": "string",
        "requirements": "string",
        "time": "string",
        "enable": "boolean"
    }
    
}
```

Example Curl

```
curl -i -H "Authorization:bearer cXrGzBczIjMkFr6Hq-ARA" -H "Content-Type:application/json" -X POST http://127.0.0.1:3000/v1/subscriptions -d '{"job_id":"1"}'
```



###  Index Jobs Subcriptions
* GET v1/jobs/:id/subscriptions_  
for enterprise 
``` 
Authorization: bearer token
```

Response sucess
```
HTTP/1.1 200

[{
    "id": integer
    "state": "string",
    "job": {
        "name": "string",
        "description": "string",
        "requirements": "string",
        "time": "string",
        "enable": "boolean"
    }
    "candidate":{

        "name":"string",
        "lastname":"string",
        "birth_date":"date",
        "observations":"string"
    } 
}]
```

Example Curl
```
curl -i -H "Authorization:bearer 4Vjk7Vt5Jg0nc11KI5sbbA" -X GET http://127.0.0.1:3000/v1/jobs/1/subscriptions
```

###  Show Jobs Subcription
* GET v1/jobs/:id/subscriptions/:id_  
for enterprise 
``` 
Authorization: bearer token
```

Response sucess
```
HTTP/1.1 200

{
    "id": integer
    "state": "string",
    "job": {
        "name": "string",
        "description": "string",
        "requirements": "string",
        "time": "string",
        "enable": "boolean"
    }
    "candidate":{

        "name":"string",
        "lastname":"string",
        "birth_date":"date",
        "observations":"string"
    } 
}
```

Example Curl
```
curl -i -H "Authorization:bearer 4Vjk7Vt5Jg0nc11KI5sbbA" -X GET http://127.0.0.1:3000/v1/jobs/1/subscriptions/1
```


###  Update Jobs Subcription
* PUT v1/jobs/:id/subscriptions/:id_  
for enterprise 
``` 
Authorization: bearer token
```
Body 
```
{"state":string}
```

Response sucess
```
HTTP/1.1 200

{
    "id": integer
    "state": "string",
    "job": {
        "name": "string",
        "description": "string",
        "requirements": "string",
        "time": "string",
        "enable": "boolean"
    }
    "candidate":{

        "name":"string",
        "lastname":"string",
        "birth_date":"date",
        "observations":"string"
    } 
}
```
Example curl
```
curl -i -H "Authorization:bearer 4Vjk7Vt5Jg0nc11KI5sbbA" -H "Content-Type:application/json" -X PUT http://127.0.0.1:3000/v1/jobs/1/subscriptions/1 -d '{"state":"contracted"}'
```


#
## Pruebas ⚙️
_Tomando como punto de partida el db:seed_

* login con el usuario foo (enterprise)
```
curl -i -H "Content-Type:application/json" -X POST http://127.0.0.1:3000/v1/users/login -d '{"username":"foo","password":"123456789"}'
```

* crear un nuevo trabajo
```
curl -i -H "Authorization:bearer Tm25t2cA9pYWUAQzKtbfEw" -H "Content-Type:application/json" -X POST http://127.0.0.1:3000/v1/jobs -d '{"name":"DevelomentJuniorPRUEBA","description":"Desarrollador junior de rails para una propuesta interesente de trabajo. Sueldo a discutir","requirements":"estudiante de Ing en sistemas o carreras a fines", "time":"parttime"}'
```



* login con el usuario foobar (candidate)
```
curl -i -H "Content-Type:application/json" -X POST http://127.0.0.1:3000/v1/users/login -d '{"username":"foobar","password":"123456789"}'
```

* Buscar los trabajos activos 
```
curl -i -H "Authorization:bearer 4ofdqlxuao5WDjpDErjBEQ" -X GET http://127.0.0.1:3000/v1/jobs
```

* Subcribir para el trabajo creado anteriormente
```
curl -i -H "Authorization:bearer 4ofdqlxuao5WDjpDErjBEQ" -H "Content-Type:application/json" -X POST http://127.0.0.1:3000/v1/subscriptions -d '{"job_id":"3"}'
```

* Con el usuario foo voy a revisar las subcripciones del trabajo
```
curl -i -H "Authorization:bearer Tm25t2cA9pYWUAQzKtbfEw" -X GET http://127.0.0.1:3000/v1/jobs/3/subscriptions
```

* Contrato a foobar
```
curl -i -H "Authorization:bearer Tm25t2cA9pYWUAQzKtbfEw" -H "Content-Type:application/json" -X PUT http://127.0.0.1:3000/v1/jobs/3/subscriptions/2 -d '{"state":"contracted"}'
```