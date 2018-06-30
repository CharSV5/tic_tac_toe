require_relative 'player'
require_relative 'board'

class Game
  attr_reader :x, :o, :turn, :board

  def create_players
    @x = Player.new('x', @board)
    @o = Player.new('o', @board)
  end

  def start_game(style)
    @turn = style == 'random' ? [@x, @o].sample : @x
  end

  def switch_player_turn
    @turn = @turn == @x ? @o : @x
  end

  def create_board(board = Board.new)
    @board = board
  end

  def create_combinations
    turn.history.combination(3).sort
  end

  end
