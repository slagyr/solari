$last_flap_time = Java::java.lang.System.currentTimeMillis

module Flapper
  VALUES = %w{ A B C D E F G H I J K L M N O P Q R S T U V W X Y Z - ' . , ? 0 1 2 3 4 5 6 7 8 9} << " "
  UPS = [5, 6, 7, 8, 9, 10]

  def casted
    @value = " "
  end

  def flap
    return if (Java::java.lang.System.currentTimeMillis - $last_flap_time < 50)
    $last_flap_time = Java::java.lang.System.currentTimeMillis
    play_flap_sound
  end

  def show(value)
    new_value = VALUES.include?(value) ? value : "?"
    current_index = VALUES.index(@value)
    new_index = VALUES.index(new_value)
    return if current_index == new_index
    @animation = animate(:updates_per_second => UPS[rand(6)]) do
      if current_index != new_index
        current_index += 1
        current_index = 0 if current_index >= VALUES.size
        @value = VALUES[current_index]
        self.text = @value
        flap
      else
        @animation.stop
      end
    end
    @animation
  end

  private

  def play_flap_sound
    play_sound('sounds/solari_sound.au') if production.config["play_sound"]
  end
end
