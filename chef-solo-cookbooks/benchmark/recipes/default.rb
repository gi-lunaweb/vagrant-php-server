# Install Redis
%w{siege}.each do |pkg|
  package pkg do
    action :install
  end
end