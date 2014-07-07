maintainer        "Gaël-Ian Havard"
maintainer_email  "gaelian.havard@gmail.com"
license           "Apache 2.0"
description       "Install Passenger"
version           "1.0.0"

%w{debian ubuntu}.each do |os|
  supports os
end

depends "apt"
depends "phusion"

recipe "passenger", "Installs Passenger using packages."
