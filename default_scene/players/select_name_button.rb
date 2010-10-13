module SelectNameButton

  def mouse_clicked(e)
    name = scene.production.randomizer.select_name
    scene.display.selected_name = name
  end

end