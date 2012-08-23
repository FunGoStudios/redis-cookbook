package 'build-essential' do
  action :install
end

package 'wget' do
  action :install
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
