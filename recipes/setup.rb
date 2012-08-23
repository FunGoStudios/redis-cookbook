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
