require 'solari_util'

module Display

  attr_reader :selected_name

  def selected_name=(name)
    @selected_name = name
    #self.text = name
    first_name, last_name = name.split(' ')
puts "#{first_name} #{last_name}"

    first_name = SolariUtil.pad(first_name)
    last_name = SolariUtil.pad(last_name)

    10.times do |c|
      scene.find("flapper_0_#{c}").show(first_name[c, 1].upcase)
    end
    10.times do |c|
      scene.find("flapper_1_#{c}").show(last_name[c, 1].upcase)
    end
  end

end