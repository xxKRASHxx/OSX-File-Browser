# API
## URL:
```
http://198.211.123.33:9998
```
## AUTH NOTE:

**Every request to API Server should be signed using JWT Token** received on `/auth/login` call with credentials provided for test.

Example for HTTP Header is like below (suppose that token value received is `AAABBBCCCC...`):

```
Authorization: Bearer AAABBBCCCC...
```

## Security:

JWT Token via `Authorization` Header Field. Example:

```
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

## Users on API
```
{
    "username": "test",
    "email": "test@local.dev",
    "password": "ohiCanRun1"
},
{
    "username": "test2",
    "email": "test2@local.dev",
    "password": "ohiCanRun2"
}
```

# ENDPOINTS

## Login: 
### [POST] /auth/login

Params:

- username
- password

### Example:
#### Request:

```
curl --request POST \
  --url http://198.211.123.33:9998/auth/login \
  --header 'content-type: application/x-www-form-urlencoded' \
  --data 'username=test&password=ohiCanRun1'
```

#### Response:
```
{
    "status": 200,
    "data": {
        "token": "eyJhbGciOiJIUzI..."
    },
    "meta": {}
}
```

where `token` field contains value for future Bearer Authentication via headers (i.e. JWT Auth).

--- 

## List Files: 
### [GET] /file


### Example:
#### Request:

```
  curl --request GET \
  --url http://198.211.123.33:9998/file \
  --header 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...'
```

#### Response:
```
{
	"status": 200,
	"data": [
		{
			"originalname": "4Yo7NDy.jpg",
			"filename": "e521edc0-fa16-11e7-b2af-45c3347d17b6",
			"mimetype": "image/jpeg",
			"size": 232449
		}
	],
	"meta": {}
}
```

--- 

## Upload File: 
### [POST] /file

**NOTE**: Used `content-type: multipart/form-data` type so uploading file being streamed to server.

**NOTE**: File Field in request should be named `secfile`

**NOTE**: Limit for file size is 200 KB

### Example:
#### Request:

```
curl --request POST \
  --url http://198.211.123.33:9998/file \
  --header 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...' \
  --header 'content-type: multipart/form-data; boundary=---011000010111000001101001' \
  --form secfile=
```

#### Response:
```
{
    "status": 200,
    "data": {
        "originalname": "4Yo7NDy.jpg",
        "filename": "e521edc0-fa16-11e7-b2af-45c3347d17b6",
        "mimetype": "image/jpeg",
        "size": 232449
    },
    "meta": {}
}
```


--- 

## Download File: 
### [GET] /file/{filename}


### Example:
#### Request:

```
curl --request GET \
  --url http://198.211.123.33:9998/file/e521edc0-fa16-11e7-b2af-45c3347d17b6 \
  --header 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...'
```

#### Response:
```
Response with file data is streamed back to client, with following headers as example

< HTTP/1.1 200 OK
< content-type: image/jpeg
< cache-control: no-cache
< Date: Mon, 15 Jan 2018 17:18:52 GMT
< Connection: keep-alive
< Transfer-Encoding: chunked
```

