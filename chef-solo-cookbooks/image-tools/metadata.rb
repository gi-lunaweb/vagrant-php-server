maintainer        "Gaël-Ian Havard"
maintainer_email  "gaelian.havard@gmail.com"
license           "Apache 2.0"
description       "Installs imagemagick and other image manipulation tools."
version "1.0.0"

%w{debian ubuntu}.each do |os|
  supports os
end

depends "apt"

recipe "image-tools", "Installs imagemagick and other image manipulation tools."