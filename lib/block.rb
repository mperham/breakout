class Block

  HEIGHT = 20
  WIDTH = 40

  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
    @color = Gosu::Color.new(0xff000000)
    @color.red = rand(256 - 40) + 40
    @color.green = rand(256 - 40) + 40
    @color.blue = rand(256 - 40) + 40
  end

  def height; HEIGHT; end
  def width; WIDTH; end

  def hit?(ball)
    left1 = ball.x
    left2 = self.x
    right1 = ball.x + ball.width
    right2 = self.x + self.width
    top1 = ball.y
    top2 = self.y
    bottom1 = ball.y + ball.height
    bottom2 = self.y + self.height

    if bottom1 < top2
      return false
    end

    if top1 > bottom2
      return false
    end

    if right1 < left2
      return false
    end

    if left1 > right2
      return false
    end

    true
  end

  def draw(window)
    window.draw_quad(x, y, @color,
                     x, y + HEIGHT, @color,
                     x + WIDTH, y + HEIGHT, @color,
                     x + WIDTH, y, @color)
  end
end
