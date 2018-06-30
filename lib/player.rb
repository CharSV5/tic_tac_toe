class Player
  attr_reader :board, :name, :history

  def initialize(name, board)
    @name = name
    @board = board
    @history = []
  end

  def play(field)
    i = field - 1
    return if @board.grid[i].class != Integer
      @board.grid[i] = @name
      record_play(field)
  end

  def record_play(field)
    @history.push(field)
  end
end
