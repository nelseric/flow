require 'json'

class MapObject
  attr_accessor :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def as_json
    {
      JSON.create_id => self.class.name,
      x: @x,
      y: @y
    }
  end

  def to_json(**args)
    as_json.to_json(**args)
  end

  def self.from_json(data)
    {
      x: data['x'],
      y: data['y']
    }
  end

  def self.json_create(data)
    new from_json(data)
  end

  def size
    10
  end

  def draw(window)
    window.draw_quad(
      x - size, y - size, color,
      x - size, y + size, color,
      x + size, y - size, color,
      x + size, y + size, color
    )
  end
end
