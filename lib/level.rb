class Level

  attr_accessor :blocks

  PADDING = 10

  def initialize
    @blocks = []
    x = PADDING
    y = 5

    3.times do |idx|
      while (x + Block::WIDTH) < World::WIDTH
        @blocks << Block.new(x, y)
        x += (Block::WIDTH + PADDING)
      end
      y += Block::HEIGHT + 5
      x = PADDING
    end
  end

  def hit?(ball)
    blocks.detect do |b|
      result = b.hit?(ball)
      if result
        # block disappears
        blocks.delete(b)
      end
      result
    end
  end

  def won?
    blocks.empty?
  end

  def draw(window)
    blocks.each { |bl| bl.draw(window) }
  end

end
