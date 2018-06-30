class Player
  attr_reader :board, :name, :history

  def initialize(name, board)
    @name = name
    @board = board
    @history = []
  end

  def play(field)
    i = field - 1
    @board.grid[i] = @name if @board.grid[i].class == Integer
  end

  def record_play(field)
    @history.push(field)
  end

end
