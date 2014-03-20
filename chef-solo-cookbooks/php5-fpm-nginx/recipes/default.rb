
# Install PHP5-FPM
%w{php5-fpm}.each do |pkg|
  package pkg do
    action :install
  end
end

service 'php5-fpm' do
  supports :status => true, :restart => true, :reload => true
  action :enable
end

template "#{node['nginx']['dir']}/conf.d/php5-fpm.conf" do
  source "php5-fpm.conf.erb"
  owner "root"
  group "root"
  mode "0644"
end

template "/etc/php5/fpm/pool.d/www.conf" do
  source "pool.conf.erb"
  owner "root"
  group "root"
  mode "0644"
end

service 'nginx' do
  supports :status => true, :restart => true, :reload => true
  action :start
end

service 'php5-fpm' do
  supports :status => true, :restart => true, :reload => true
  action :start
end
