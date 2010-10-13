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
select_name_button :id => "select_name_button", :players => "button", :text => "Select New Name"