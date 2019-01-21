# hardened-alpine
Hardened alpine linux baseimage for Docker.

## How is this different?
- 

## Example
```
# download this repo
git clone https://github.com/hazcod/hardened-alpine
cd hardened-alpine/

# build our baseimage
docker build -t hardened-alpine .

# build our example
docker build -t hardened-nginx example/

# run our example
docker run -ti -p 80:8080 -p 443:8443 hardened-nginx
```
