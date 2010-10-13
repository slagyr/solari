module Display

  attr_reader :selected_name

  def selected_name=(name)
    @selected_name = name
    self.text = name
  end

end