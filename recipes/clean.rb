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
