maintainer        "Gaël-Ian Havard"
maintainer_email  "gaelian.havard@gmail.com"
license           "Apache 2.0"
description       "Phusion repositories"
version           "1.0.0"

%w{debian ubuntu}.each do |os|
  supports os
end

depends "apt"

recipe "phusion", "Phusion repositories"

attribute "phusion/target-release",
  :display_name => "Phusion target release",
  :description  => "Phusion target release",
  :default      => "precise"
  
attribute "phusion/pin-priority",
  :display_name => "Phusion pin priority",
  :description  => "Phusion pin priority for apt/preferences",
  :default      => "800"