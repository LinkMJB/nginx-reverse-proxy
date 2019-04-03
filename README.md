# nginx-reverse-proxy

## Building

Run: `make image`

## Using

This docker image takes 3 optional arguments:
- REMOTE_HOST
-- This defaults to 'localhost' if unprovided
- REMOTE_PORT
-- This defaults to '8993' if unprovided
- LOCAL_CONTEXT
-- This defaults to '' if unprovided, must end in `/`, may need to be escaped, e.g. `-e 'LOCAL_CONTEXT=ddf\/'`

### NOTE:
After running the container following the example below, you will want to check what port got assigned to your machine for PAT to occur (`docker ps -a`).
Otherwise, you can statically define this by using the argument `-p 8443:8443` instead of including `-P` for automatic PAT assignments.

### Example:

```
~
matthew.bates@LinkMJB🍺 $ docker run -e REMOTE_HOST=google.com -e REMOTE_PORT=443 -itP linkmjb/nginx-reverse-proxy:latest
...Generating SSL certificates
Generating a 2048 bit RSA private key
.................................+++
.......................................................................................................................................................................+++
writing new private key to '/etc/nginx/cert.key'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:US
State or Province Name (full name) [Some-State]:AZ
Locality Name (eg, city) []:Phoenix
Organization Name (eg, company) [Internet Widgits Pty Ltd]:m4s73rz
Organizational Unit Name (eg, section) []:allyourbatesesarebelongtous
Common Name (e.g. server FQDN or YOUR name) []:linkmjb.local
Email Address []:linkmjb@gmail.com
...Setting up as reverse proxy to google.com:443
...Running nginx
<ACCESS/ERROR LOGS BEGIN HERE>
...
...
...
```
