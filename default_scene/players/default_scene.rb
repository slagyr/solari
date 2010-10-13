module DefaultScene
  prop_reader :display, :select_name_button

  def scene_opened(e)
    production.randomizer.load_names
  end

end