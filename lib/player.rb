class Player
  attr_reader :board, :name

  def initialize(name, board)
    @name = name
    @board = board
  end

  def play(field)
      i = field - 1
      if @board.grid[i].class == Integer
        @board.grid[i] = @name
      end
    end
end
