require 'pry'

class Map
  def self.load map_path
    data = JSON.load(map_path)

    map = new(
      size_x: data['size_x'],
      size_y: data['size_y'],
      objects: data['objects']
    )

    data["connectors"].each do |con|
      map.connectors << Connector.new(
        a: map.objects[con['a']],
        b: map.objects[con['b']]
      )
    end

    return map
  end

  attr_accessor :objects, :connectors, :size_x, :size_y

  def initialize connectors: [], objects: [], size_x: 800, size_y: 600
    @objects = objects
    @connectors = connectors
    @size_x = size_x
    @size_y = size_y
  end

  def draw(window)
    connectors.each do |con|
      con.draw window
    end
    objects.each do |object|
      object.draw window
    end
  end

  def objects
    @objects
  end

  def connectors
    @connectors
  end

  def update
    objects.each &:update
    connectors.each &:update
  end

end
