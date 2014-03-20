
# Install PHP5
%w{php5-mysql php5-curl php5-gd php5-mcrypt php5-sqlite php5-tidy php5-xmlrpc php5-xsl php5-redis php5-cli}.each do |pkg|
  package pkg do
    action :install
  end
end