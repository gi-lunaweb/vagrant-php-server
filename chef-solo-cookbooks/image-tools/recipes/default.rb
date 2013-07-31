# Install Imagemagick
%w{imagemagick pngcrush libjpeg-progs}.each do |pkg|
  package pkg do
    action :install
  end
end