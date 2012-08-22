redis-cookbook
==============

A simple Chef cookbook to install Redis from source and use upstart to control the server process.

Attributes
----------
* `redis['config_dir']` - Specify where to store Redis configuration file. Default to /etc/redis.
* `redis['data_dir']` - The directory used for Redis data. Default to /var/lib/redis.
* `redis['log_dir']` - The path for the Redis log file. Default to /var/log/redis.
* `redis['user']` - The user which run the Redis server. Default to redis.
* `redis['port']` - The port to which bind the server. Default to 6379.
* `redis['bind_address']` - The IP address to bind the server to. Default to 127.0.0.1.
* `redis['version]` - The version of Redis to install. Default to 2.4.16, the last stable version
  at the moment of writing this README file. Be sure to set it to the version you want to install.
