# Install Passenger
%w{nginx-extras passenger}.each do |pkg|
  package pkg do
    action :install
  end
end