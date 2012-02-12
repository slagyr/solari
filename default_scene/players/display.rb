require 'solari_util'

module Display
  attr_reader :selected_name

  def animations
    @animations ||= []
  end

  def selected_name=(name)
    return if name.nil?
    @selected_name = name
    first_name, last_name = name.split(' ')

    first_name = SolariUtil.pad(first_name)
    last_name = SolariUtil.pad(last_name)

    @animations = []
    SolariUtil.max.times do |c|
      @animations << scene.find("flapper_0_#{c}").show(first_name[c, 1].upcase)
    end
    SolariUtil.max.times do |c|
      @animations << scene.find("flapper_1_#{c}").show(last_name[c, 1].upcase)
    end
  end
end
