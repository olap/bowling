class Game
  def initialize
    @frames = []
  end

  def roll(pins)
    # defined only to take integers
    if @frames.size == 9
      @current_frame ||= []
      if @current_frame.size == 0
        @current_frame = [pins]
      elsif @current_frame.size == 2
        @current_frame << pins
        add_frame(@current_frame)
      else
        @current_frame << pins
        if ![10, 20].include? (@current_frame[0] + @current_frame[1])
          add_frame(@current_frame)
        end
      end
    else
      if !@current_frame.nil?
        @current_frame << pins
        add_frame(@current_frame)
      else
        if pins == 10
          @frames << [10]
        else
          @current_frame = [pins]
        end
      end
    end
  end

  def score
    @frames.map.each_with_index do |frame, index|
      if frame[0] == 10
        score_strike(index)
      elsif frame[0] + frame[1] == 10
        score_half(index)
      else
        frame[0] + frame[1]
      end
    end.reduce(:+)
  end

  def to_s
    @frames.flatten.map(&:to_s).join
  end

  private
  def score_strike(index)
    if index == 9
      10 + @frames[index][1] + @frames[index][2]
    else
      next_frame = @frames[index+1] || []
      next_again_frame = @frames[index+2] || []
      if next_frame.size == 1
        next_roll = next_again_frame[0] || 0 
        20 + next_roll
      else
        10 + next_frame[0] + next_frame[1]
      end
    end
  end

  def score_half(index)
    if index == 9
      return 10 + @frames[index][2]
    end

    next_frame = @frames[index+1]
    if next_frame.nil?
      return 10
    else
      10 + next_frame[0]
    end
  end

  def add_frame(frame)
    @frames << frame
    @current_frame = nil
  end
end
