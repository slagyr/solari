head do
  head_logo :image => "images/8thlightlogo_transparent.png", :players => "image", :width => "20%"
  head_logo :image => "images/scna_logo.png", :players => "image", :width => "60%"
  head_logo :image => "images/obtiva.png", :players => "image", :width => "20%"
end
display :id => "display" do
  2.times do |r|
    line :id => "line_#{r}" do
      10.times do |c|
        flapper :id => "flapper_#{r}_#{c}", :text => " "
      end
      gap
    end
  end
end
tail do
  tail_section :styles => "ad_section", :left_margin => 10 do
    ad_line { ad :players => "image", :image => "images/agile_alliance.png" }
    ad_line { ad :players => "image", :image => "images/github.png" }
    ad_line { ad :players => "image", :image => "images/infoq.png" }
  end
  tail_section do
    select_name_button :id => "select_name_button"
  end
  tail_section :styles => "ad_section", :right_margin => 10 do
    ad_line { ad :players => "image", :image => "images/oreilly.png" }
    ad_line { ad :players => "image", :image => "images/informit.png" }
    ad_line { ad :players => "image", :image => "images/windycityrails.png" }
    ad_line { ad :players => "image", :image => "images/pragmaticbookshelf.png" }
  end
end
