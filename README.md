# Prosody

This docker images is build from the [Prosody source](https://hg.prosody.im/).

# Supported tags and respective `Dockerfile` links

- [`trunk`, `latest` (*trunk/Dockerfile*)](https://github.com/Fankserver/docker-prosody/blob/master/trunk/Dockerfile)
- [`0.10-dev` (*0.10/Dockerfile*)](https://github.com/Fankserver/docker-prosody/blob/master/0.10/Dockerfile)
- [`0.9-dev`, `0.9.12`, `stable` (*0.9/Dockerfile*)](https://github.com/Fankserver/docker-prosody/blob/master/0.9/Dockerfile)

## Running

Docker image based on __Ubuntu 16.04 LTS__.
```bash
docker run -d --name prosody -p 5222:5222 -p 5269:5269 -p 5280:5280 -p 5281:5281 fankserver/prosody
```

### Ports

The images exposes the following ports
* __80__: HTTP
* __443__: HTTPS
* __5222__: c2s
* __5269__: s2s
* __5347__: XMPP component
* __5280__: HTTP BOSH
* __5281__: HTTPS BOSH

### Folders

* __/etc/prosody__:
	* Generated prosody configuration file
* __/etc/prosody/conf.d__:
	* Custom prosody configuration file(s)
	* Preset:
		* [Recommended configuration](examples/recommended.cfg.lua)
* __/etc/prosody/certs__:
	* SSL certificates
* __/var/lib/prosody__:
	* Prosody data folder
* __/var/log/prosody__:
	* Log files for prosody
	* Note: logfiles are disabled by default, because they only log to stdout & stderr for docker.
* __/usr/src/prosody__:
	* Prosody source code
	* Note: will only be used for the build process and for debugging purpose.
* __/usr/src/prosody_modules__:
	* Community modules source code
	* Note: this folder will be included by `prosody.cfg.lua` so you only need to include them in the `modules_enabled`.

### Configuration

By default, the __prosody.cfg.lua__ should be not __overwritten__, if you want to overwrite it here is the [original file](examples/default.cfg.lua).

There is a `/etc/prosody/conf.d/` folder where `*.lua` can be added, which will be included by prosody and configuration can be added and changed, but not __extended__ from those files!

## Examples

- Easy setup [Docker compose for prosody](examples/basic)
- [Docker compose for prosody & PostgreSQL](examples/basic_database)
