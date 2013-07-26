bash "dotdeb keys" do
  code <<-EOH
wget http://www.dotdeb.org/dotdeb.gpg
cat dotdeb.gpg | sudo apt-key add -
EOH
  action :nothing
end

execute "apt-get update" do
  action :nothing
end

template "/etc/apt/preferences.d/dotdeb.pref" do
  source "dotdeb.pref.erb"
  mode 0644
  owner "root"
  group "root"
end

template "/etc/apt/sources.list.d/dotdeb.list" do
  source "dotdeb.list.erb"
  mode 0644
  owner "root"
  group "root"
  notifies :run, resources(:bash => "dotdeb keys", :execute => "apt-get update"), :immediately
end