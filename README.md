# ironpeakservices/hardened-alpine:
Hardened alpine linux baseimage for Docker.

Note: If you use Golang, build statically and use a scratch image. If you are using Java/Python/NodeJS/dotnet, use a [distroless image](https://github.com/GoogleContainerTools/distroless) instead.

Check it out [on Docker Hub](https://hub.docker.com/r/ironpeakservices/hardened-alpine)!

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
`docker pull ironpeakservices/hardened-alpine`

See [the nginx example](example/).

## Additional
If you want, you can also enable vulnerability scanning during your build (for free).
Take a look at https://github.com/aquasecurity/microscanner
