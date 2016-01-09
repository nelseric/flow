class Connector

  attr_reader :node_a, :node_b, :flow

  def initialize a:, b:, flow: 20.0
    @node_a = a
    @node_b = b
    @flow = flow
  end

  def update
    if node_a && node_b
      node_a.value -= flow_rate
      node_b.value += flow_rate
    end
  end

  def pressure_diff
    node_a.pressure - node_b.pressure
  end

  def flow_rate
    pressure_diff * flow
  end

  def draw(window)
    if node_a and node_b
      window.draw_line(
          node_a.x, node_a.y, color,
          node_b.x, node_b.y, color)
    end
  end

  def color
    white = (1.0 - pressure_diff) * 255
    Gosu::Color.new 255, white, white, 255
  end
end
