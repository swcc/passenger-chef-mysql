# Docker Passenger-Nginx Server with mysqlclient libs

This image is perfect to run a nginx+passenger server for applications that needs mysql client libs.

To use, build the Docker container or pull it from the index (`docker pull swcc/passenger-chef-ruby`):

```bash
# cd into the git repository
cd /path/to/repo/passenger-chef-mysql
docker build -t passenger-chef-mysql .    # Build a Docker image named "passenger-chef-mysql" from this location "."
# wait for it to build...
```

### Run the docker container
_Give container a name in case it's linked to another app container_
```
docker run -p 80:80 -d passenger-chef-mysql -v /my/app:/home/app /sbin/my_init --enable-insecure-key
```

* `docker run` - starts a new docker container
  * `-p 8080:80` - Binds the local port 8080 to the container's port 80.
  * `-d passenger-chef-mysql` - Use the image tagged "passenger-chef-mysql"
  * `-v /my/app:/home/app` - Mount your local application folder in the container's app folder `/home/app`.
    If you have a `startup.sh` in your application root folder, it will be launched before the init script of the container. This is the best place to setup your app as needed (e.g. `bundle install` or `npm install`, `bundle db:migrate`....)
  * `/sbin/my_init` - Run the init scripts used to kick off long-running processes and other bootstrapping, as per [phusion/baseimage-docker](https://github.com/phusion/baseimage-docker)
  * `--enable-insecure-key` - Enable a generated SSL key so you can SSH into the container, again as per [phusion/baseimage-docker](https://github.com/phusion/baseimage-docker). Generate your own SSH key for production use.
