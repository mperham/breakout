class World < Gosu::Window

  WIDTH = 640
  HEIGHT = 480

  def initialize
    super(WIDTH, HEIGHT, false)
    self.caption = "Breakout!"

    @ball = Ball.new(self)
    @paddle = Paddle.new
    @level = Level.new

    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
    @score = 0
  end

  def update
    @ball.update

    if button_down?(Gosu::KbLeft) || button_down?(Gosu::GpLeft)
      @paddle.left
    end
    if button_down?(Gosu::KbRight) || button_down?(Gosu::GpRight)
      @paddle.right
    end

    # check if we hit the bottom
    if @ball.y >= World::HEIGHT
      puts "You lost, jive sucker."
      exit(-1)
    end

    if @ball.x <= 0
      @ball.bounce
    elsif @ball.y <= 0
      @ball.bounce
    elsif @ball.x >= World::WIDTH
      @ball.bounce
    elsif @level.hit?(@ball)
      @ball.bounce
      @score += 100
    elsif @paddle.hit?(@ball)
      @ball.bounce
    end

    if @level.won?
      puts "You're a big winner!"
      exit(0)
    end
  end

  def draw
    @font.draw("Score: #{@score}", 10, 10, 1, 1.0, 1.0, 0xffffff00)

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
