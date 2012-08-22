maintainer        'Matteo Centenaro'
maintainer_email  'bugant@gmail.com'
license           'Apache 2.0'
description       'Install Redis server from source'
version           '0.1.0'

attribute 'redis/config_dir',
  :display_name => 'Config directory',
  :description => 'Directory hosting the Redis configuration file',
  :default => '/etc/redis'

attribute 'redis/data_dir',
  :display_name => 'Data directory',
  :description => 'Directory where to store Redis data',
  :default => '/var/lib/redis'

attribute 'redis/log_dir',
  :display_name => 'Log directory',
  :description => 'Log directory',
  :default => '/var/log/redis'

attribute 'redis/user',
  :display_name => 'Redis user',
  :description => 'The user which run the Redis server',
  :default => 'redis'

attribute 'redis/port',
  :display_name => 'Redis port',
  :description => 'The port at which Redis listen for incoming connections',
  :default => '6379'

attribute 'redis/bind_address',
  :display_name => 'Redis bind address',
  :description => 'The IP address at which the server binds to, set it to nil if you want to bind to any IP address',
  :default => '127.0.0.1'

attribute 'redis/version',
  :display_name => 'Redis version',
  :description => 'The version of Redis to install',
  :default => '2.4.16'

attribute 'redis/remove_build_essential',
  :display_name => 'Remove build_essential',
  :description => 'Remove building tools after installation',
  :default => 'true'

attribute 'redis/remove_wget',
  :display_name => 'Remove wget',
  :description => 'Remove wget after installation',
  :default => 'true'

attribute 'redis/include_files',
  :description => 'Redis additional config files',
  :default => []
