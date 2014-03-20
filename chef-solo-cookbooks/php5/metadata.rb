maintainer        "Gaël-Ian Havard"
maintainer_email  "gaelian.havard@gmail.com"
license           "Apache 2.0"
description       "Installs PHP5"
version           "1.0.0"

%w{debian ubuntu}.each do |os|
  supports os
end

depends "apt"
depends "dotdeb"
depends "mysql"
depends "sqlite"
depends "redis"

recipe "php5", "Installs PHP5 using packages."