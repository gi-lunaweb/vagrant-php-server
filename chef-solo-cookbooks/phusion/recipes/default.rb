bash "phusion keys" do
  code "apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7"
  action :nothing
end

%w(apt-transport-https ca-certificates).each do |pkg|
  package pkg do
    action :install
  end
end

execute "apt-get update" do
  action :nothing
end

template "/etc/apt/preferences.d/phusion.pref" do
  source "phusion.pref.erb"
  mode 0644
  owner "root"
  group "root"
end

template "/etc/apt/sources.list.d/phusion.list" do
  source "phusion.list.erb"
  mode 0644
  owner "root"
  group "root"
  notifies :run, resources(:bash => "phusion keys", :execute => "apt-get update"), :immediately
end