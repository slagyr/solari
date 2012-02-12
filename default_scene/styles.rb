# This file, (styles.rb) inside a scene, should define any styles specific to the containing scene.
# It makes use of the StyleBuilder DSL.
#
# For more information see: http://limelightwiki.8thlight.com/index.php/A_Cook%27s_Tour_of_Limelight#Styling_with_styles.rb
# For a complete listing of style attributes see: http://limelightwiki.8thlight.com/index.php/Style_Attributes

default_scene {
  background_color "#2C2C2C"
  horizontal_alignment :center
  vertical_alignment :top
  width "100%"
  height "100%"
}

head {
  width "100%"
  horizontal_alignment :center
  vertical_alignment :center
  top_margin 10
}

head_logo {
  left_padding 20
  right_padding 20
}

display {
  top_margin 90
  width "100%"
  font_size 30
  text_color :blue
  horizontal_alignment :center
}

select_name_button {
  width 100
  height 100
  background_image "images/departure.png"
  hover {
    background_image "images/departure_blue.png"
  }
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

tail {
  top_margin 50
  vertical_alignment :center
}

tail_section {
  left_padding 10
  right_padding 10
  horizontal_alignment :center
  vertical_alignment :center
}

ad_section {
  background_color :white
  border_color :grey
  border_width 2
  rounded_corner_radius 5
}

ad_line {
  width "100%"
  padding 5
  horizontal_alignment :center
  vertical_alignment :center
}
