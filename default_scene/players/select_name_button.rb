module SelectNameButton
  def mouse_clicked(e)
    return if disabled?
    disable
    name = scene.production.randomizer.select_name
    scene.display.selected_name = name
  end

  def disabled?
    enable unless animations_still_running?
    @enabled == false
  end

  def animations_still_running?
    scene.display.animations.any?{|a| a && a.running?}
  end

  def enable
    @enabled = true
  end

  def disable
    @enabled = false
  end
end
