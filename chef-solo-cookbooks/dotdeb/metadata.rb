maintainer        "Gaël-Ian Havard"
maintainer_email  "gaelian.havard@gmail.com"
license          "Apache 2.0"
description      "Dotdeb repositories"
version          "1.0.0"

%w{debian ubuntu}.each do |os|
  supports os
end

depends "apt"

recipe "dotdeb", "Dotdeb repository"

attribute "dotdeb/target-release",
  :display_name => "Dotdeb target release",
  :description  => "Dotdeb target release",
  :default      => "stable"
  
attribute "dotdeb/pin-priority",
  :display_name => "Dotdeb pin priority",
  :description  => "Dotdeb pin priority for apt/preferences",
  :default      => "600"