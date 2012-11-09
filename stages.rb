# This file (stages.rb) is used to define the stages within your production.

stage "default" do
  default_scene "default_scene"
  title "Solari"
  location :center, :center
  framed false
  fullscreen true
end

#stage "devtool" do
# default_scene "devtool"
# title "Dev Tool"
# location [0, 0]
# size [100, 100]
# background_color "transparent"
# framed false
#end
