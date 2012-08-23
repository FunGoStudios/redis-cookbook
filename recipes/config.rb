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
  variables({
    :user => node[:redis][:user],
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
