node['nginx-vhosts']['vhosts'].each do |vhost_name, vhost_content|
  file "#{node['nginx']['dir']}/sites-available/#{vhost_name}" do
    content vhost_content
    owner "root"
    group "root"
    mode "0644"
  
    notifies :reload, "service[nginx]"
  end
  
  nginx_site vhost_name
end