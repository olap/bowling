class Game
  def initialize
    @frames = []
  end

  def roll(pins)
    # defined only to take integers
    @frames << pins
  end

  def score
    @frames.reduce(:+)
  end

  def to_s
    @frames.flatten.map(&:to_s).join
  end
end
