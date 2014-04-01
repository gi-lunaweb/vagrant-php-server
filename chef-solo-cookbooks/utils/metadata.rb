maintainer        "Gaël-Ian Havard"
maintainer_email  "gaelian.havard@gmail.com"
license           "Apache 2.0"
description       "Installs and setup utility tools"
version "1.0.0"

%w{debian ubuntu}.each do |os|
  supports os
end

depends "apt"

recipe "utils", "Installs and setup utility tools."

attribute "utils/packages",
  :display_name => "Packages to install",
  :description  => "Packages to install",
  :default      => []