maintainer        "Gaël-Ian Havard"
maintainer_email  "gaelian.havard@gmail.com"
license           "Apache 2.0"
description       "Installs and setup Passenger on nginx"
version           "1.0.0"

%w{debian ubuntu}.each do |os|
  supports os
end

depends "apt"
depends "dotdeb"
depends "phusion"
depends "nginx"
depends "passenger"

recipe "passenger-nginx", "Installs Passenger using packages."