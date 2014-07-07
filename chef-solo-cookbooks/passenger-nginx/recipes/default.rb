template "#{node['nginx']['dir']}/conf.d/passenger.conf" do
  source "passenger.conf.erb"
  owner "root"
  group "root"
  mode "0644"
end

service 'nginx' do
  supports :status => true, :restart => true, :reload => true
  action :start
end