Hasu.load "map_object.rb"

class Buffer < MapObject

  attr_reader :value

  def initialize value: 0.0, max: 100.0, **args
    @value = value || 0.0
    @max = max || 100.0
    super(**args)
  end

  def value=(val)
    if val <= 0.0
      @value = 0.0
    elsif val > @max
      @value = @max
    else
      @value = val
    end
  end

  def pressure
    @value / @max
  end

  def size
    10 + pressure * 5
  end

  def color
    red = 255 * (1.0 - pressure)
    green = 255 * pressure
    # binding.pry
    Gosu::Color.new 255, red, green, 0
  end

  def update
  end


  def as_json
    super.merge(
      value: @value,
      max: @max
    )
  end

  def self.from_json(data)
    super.merge(
      value: data["value"],
      max: data["max"]
    )
  end

end
