class World < Gosu::Window

  WIDTH = 640
  HEIGHT = 480

  def initialize
    super(WIDTH, HEIGHT, false)
    self.caption = "Breakout!"

    @ball = Ball.new(self)
    @paddle = Paddle.new
    @level = Level.new(self)
  end

  def update
    @ball.update

    if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then
      @paddle.left
    end
    if button_down? Gosu::KbRight or button_down? Gosu::GpRight then
      @paddle.right
    end

    if @ball.y >= World::HEIGHT
      puts "You lost, jive sucker."
      exit(-1)
    end

    if @level.hit?(@ball)
      @level.last_hit_block = true
      @level.combo!
      @ball.bounce
    end

    if @paddle.hit?(@ball)
      @level.last_hit_block = false
      @level.combo = false
      @ball.bounce
    end

    if @level.won?
      puts "You're a big winner!"
      exit(0)
    end
  end

  def draw
    @paddle.draw(self)
    @ball.draw(self)
    @level.draw(self)
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end
