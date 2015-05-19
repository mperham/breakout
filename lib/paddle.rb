class Paddle
  attr_accessor :x, :y, :height, :width

  WHITE = Gosu::Color.new(0xFFFFFFFF)

  def initialize(width = 80, x = 300)
    @height = 20
    @width = width
    @x = x
    @y = World::HEIGHT - 20
  end

  def right
    @x += 6 if @x < World::WIDTH - @width
  end

  def left
    @x -= 6 if @x > 0
  end

  def draw(window)
    window.draw_quad(@x, World::HEIGHT - 20, WHITE, @x + @width, World::HEIGHT - 20, WHITE, @x + @width, World::HEIGHT - 5, WHITE, @x, World::HEIGHT - 5, WHITE)
  end

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

end
