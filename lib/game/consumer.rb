Hasu.load 'game/buffer.rb'

class Consumer < Buffer

  def update
    self.value = self.value - rand(0.0..6.0)
    super
  end

  def draw window
    super
    window.draw_quad(
      x - size/3, y - size/3, Gosu::Color::RED,
      x - size/3, y + size/3, Gosu::Color::RED,
      x + size/3, y - size/3, Gosu::Color::RED,
      x + size/3, y + size/3, Gosu::Color::RED
    )
  end
end
