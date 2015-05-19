class Ball
  attr_accessor :x, :y, :width, :height

  WHITE = Gosu::Color.new(0xFFFFFFFF)

  PI = 3.14

  def initialize(window, width = 20, x = World::WIDTH/2, y = World::HEIGHT - 40 )
    @width = width
    @height = width
    @x = x
    @y = y
    @angle = PI / 4
    @ball = Gosu::Image.new(window, "ball.jpg", true)
  end

  def draw(window)
    @ball.draw(@x, @y, 1)
  end

  def update
    @x += Math.sin(@angle) * 5
    @y += Math.cos(@angle) * 5
  end

  def bounce
    @angle += PI/2
  end
end
