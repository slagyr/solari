# This file, (styles.rb) inside a scene, should define any styles specific to the containing scene.
# It makes use of the StyleBuilder DSL.
#
# For more information see: http://limelightwiki.8thlight.com/index.php/A_Cook%27s_Tour_of_Limelight#Styling_with_styles.rb
# For a complete listing of style attributes see: http://limelightwiki.8thlight.com/index.php/Style_Attributes

default_scene {
  background_color "#111"
  horizontal_alignment :center
  vertical_alignment :center
  width "100%"
  height "100%"
}

display {
  width "100%"
  font_size 30
  text_color :blue
  horizontal_alignment :center
  bottom_margin 50
}

select_name_button {
  width 200
}

flapper {
  width 102
  height 150
  horizontal_alignment :center
  vertical_alignment :center
  text_color :white
  font_size 120
  font_face "ayuthaya"
  font_style "bold"

  border_color :black
  border_width 2

  background_color "#FFF3"
  secondary_background_color :black
  gradient_angle 270
  gradient :on
  gradient_penetration 55
}

gap {
  width "100%"
  height 10
  background_image "images/gap.png"
  background_image_fill_strategy :repeat_x
  float :on
  x 0
  y 70
}