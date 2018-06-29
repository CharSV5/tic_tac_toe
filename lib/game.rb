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

  def play(field)
      i = field - 1
      if @board.grid[i].class == Integer
        @board.grid[i] = @turn.name
        @turn.record.record_play(field)
      end
    end
  end
