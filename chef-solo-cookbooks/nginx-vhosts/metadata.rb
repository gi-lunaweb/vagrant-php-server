maintainer        "Gaël-Ian Havard"
maintainer_email  "gaelian.havard@gmail.com"
license           "Apache 2.0"
description       "Add vhosts to nginx"
version           "1.0.0"

%w{debian ubuntu}.each do |os|
  supports os
end

depends "nginx"

recipe "nginx-vhosts", "Add vhosts to nginx"

attribute "nginx-vhosts/vhosts",
  :display_name => "Vhosts to add to nginx",
  :description  => "vhosts that will be added to nginx configuration",
  :default      => []