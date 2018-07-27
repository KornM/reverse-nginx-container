# NGINX Container as reverseproxy


## Description 

Container forwards all requests to URL given in parameter PROXYPASS

Container can handle basic auth with user password, in that case please add

  USERNAME=<user>
  PASSWORD=<encrypted-pwd> 

to the environment.

Encrypt with openssl and apr1
echo password |openssl passwd -apr1 -stdin

## Arguments

|  Arguments	| Mandatory 	| Detail 	| Value 	|
|---	|---	|---	|---	|
|  PROXYPASS	| Yes 	| Redirect Url 	| http://www.google.de 	|
|  USERNAME	| No 	| Username for Basic Auth 	| user 	|
|  PASSWORD	| No 	| Password for Basic Auth 	| password 	|
|  HTTPVERBS	| No 	| Allowed VERBS for Request 	|  GET\|POST\|PUT\|HEAD	|


## Example: 

without basic auth:

```
docker run -p 0.0.0.0:80 -e PROXYPASS="http://www.google.de"
```

with basic auth:
```
docker run -p 0.0.0.0:80 -e USERNAME=user -e PASSWORD='$apr1$rqAt6p.S$N1U1Vot16Cb3XVhdsq0yD.' -e PROXYPASS="http://www.google.de"
```

with VERB Restriction:

```
docker run -p 0.0.0.0:80 -e PROXYPASS="http://www.google.de" -e HTTPVERBS="GET|POST|PUT|HEAD"
```