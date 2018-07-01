require_relative 'player'
require_relative 'board'

class Game
  attr_reader :x, :o, :turn, :board, :game_over, :win, :game

  def initialize
    @game_over = false
  end

  def self.create
    @game = Game.new
  end

  def self.instance
    @game
  end

  def run
    create_board
    create_players
    start_game('random')
  end

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
    turn.history.sort.combination(3).sort
  end

  def winner?
    @win = @board.combinations.map do |comb|
      create_combinations.include?(comb)
    end
    @win.include?(true)
  end

  def draw?
    @board.grid.all? { |field| field.class == String }
  end
end
