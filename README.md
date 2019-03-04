# hardened-alpine
Hardened alpine linux baseimage for Docker.

Note: If you use Golang, build statically and use a scratch image. If you are using Java/Python/NodeJS/dotnet, use a [distroless image](https://github.com/GoogleContainerTools/distroless) instead.

## How is this different?
- ca-certificates included
- /app for everything app-related; /app/conf, /app/tmp, /app/data
- no interactive shells for users
- removed unneccessary accounts, only 'app' and 'root' users
- removed crontabs
- removed dangerous commands and utilities
- strictened permissions on system files and directories
- removed temporary shadow/passwd/group
- removed suid/guid files
- removed init scripts
- removed kernel tunables
- removed /root/
- removed fstab
- post-install.sh:
	- removes apk manager after installation
	- sets permissions on /app after installation

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

## Additional
If you want, you can also enable vulnerability scanning during your build (for free).
Take a look at https://github.com/aquasecurity/microscanner
