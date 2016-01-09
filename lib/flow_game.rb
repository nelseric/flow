require 'hasu'


Hasu.load 'map.rb'
Hasu.load 'game/connector.rb'
Hasu.load 'game/producer.rb'
Hasu.load 'game/consumer.rb'
Hasu.load 'game/buffer.rb'

class FlowGame < Hasu::Window
  WIDTH = 800 unless defined? WIDTH
  HEIGHT = 600 unless defined? HEIGHT

  def initialize
    super(WIDTH, HEIGHT, false)
  end

  def reset
    @map = Map.load($maps + "second.json")
  end

  def update
    @map.update
  end

  def draw
    @map.draw self
  end


  def needs_cursor?
    true
  end
end
