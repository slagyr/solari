require 'solari_util'

head do
  head_logo :image => "images/8L-Logo.png", :players => "image"
end
display :id => "display" do
  2.times do |row|
    line :id => "line_#{row}" do
      SolariUtil.max.times do |col|
        flapper :id => "flapper_#{row}_#{col}", :text => " "
      end
      gap
    end
  end
end
tail do
  tail_section do
    select_name_button :id => "select_name_button"
  end
end
