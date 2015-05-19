class Level

  attr_accessor :blocks, :last_hit_block, :combo

  PADDING = 10

  def initialize(window)
    @font = Gosu::Font.new(window, Gosu::default_font_name, 20)
    @score = 0
    @blocks = []
    x = PADDING
    y = 5
    @last_hit_block = false

    3.times do |idx|
      while (x + Block::WIDTH) < World::WIDTH
        @blocks << Block.new(x, y)
        x += (Block::WIDTH + PADDING)
      end
      y += Block::HEIGHT + 5
      x = PADDING
    end
    @combo = false
    @window = window
  end

  def hit?(ball)
    if ball.x <= 0
      return true
    end

    if ball.y <= 0
      return true
    end

    if ball.x >= World::WIDTH
      return true
    end

    blocks.detect do |b|
      result = b.hit?(ball)
      if result
        if @last_hit_block
          @combo = true
        end
        # block disappears
        @score += rand(1000)
        blocks.delete(b)
      end
      result
    end
  end

  def won?
    blocks.empty?
  end

  def draw(window)
    if @combo
      @font.draw('COMBO', @cx , @cy, 1, 1.0, 1.0, 0xffffff00)
    end
    blocks.each { |bl| bl.draw(window) }
    @font.draw("Score: #{@score}", 10, 10, 1, 1.0, 1.0, 0xffffff00)
  end

  def combo!
    @combo = true
    @cx = rand(World::WIDTH)
    @cy = rand(World::HEIGHT)
  end

end
