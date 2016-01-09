Hasu.load 'game/buffer.rb'

class Producer < Buffer

  def update
    self.value = self.value + 5.0
    super
  end

  def draw window
    super
    window.draw_quad(
      x - size/3, y - size/3, Gosu::Color::BLUE,
      x - size/3, y + size/3, Gosu::Color::BLUE,
      x + size/3, y - size/3, Gosu::Color::BLUE,
      x + size/3, y + size/3, Gosu::Color::BLUE
    )
  end
end
