package 'build-essential' do
  action :install
end

package 'wget' do
  action :install
end

user node[:redis][:user] do
  action :create
  system true
end

[node[:redis][:config_dir], node[:redis][:data_dir], node[:redis][:log_dir]].each do |dir|
  directory dir do
    owner node[:redis][:user]
    group node[:redis][:user]
    mode '0755'
    action :create
  end
end

template '/tmp/build_and_install.sh' do
  source 'build_and_install.sh.erb'
  mode '0755'
  variable({:version => node[:redis][:version]})
end

bash 'compile and install redis' do
  cwd '/tmp'
  code <<-EOC
    ./build_and_install.sh
    rm build_and_install.sh
    rm -rf redis-*
  EOC
end

template "#{node[:redis][:config_dir]}/redis.conf" do
  source 'redis.conf.erb'
  user node[:redis][:user]
  mode '0644'
  variable({
    :log_dir => node[:redis][:log_dir],
    :data_dir => node[:redis][:data_dir],
    :port => node[:redis][:port],
    :bind_address => node[:redis][:bind_address],
    :include_files => node[:redis][:include_files]
  })
end

template '/etc/init/redis.conf' do
  source 'redis.conf.upstart.erb'
  mode '0644'
  variable({
    :user => node[:redis][:user]
    :config_dir => node[:redis][:config_dir]
  })
end

service 'redis' do
  provider Chef::Provider::Service::Upstart
  supports :start => true, :stop => true
end

if node[:redis][:start_server]
  service 'redis' do
    provider Chef::Provider::Service::Upstart
    action :start
  end
end

if node[:redis][:remove_build_essential]
  package 'build_essential' do
    action :purge
  end
end

if node[:redis][:remove_wget]
  package 'wget' do
    action :purge
  end
end
