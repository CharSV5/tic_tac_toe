require_relative 'player'

class Game
  attr_reader :x, :o, :turn

  def create_players
    @x = Player.new('x')
    @o = Player.new('o')
  end

  def start_game(style)
    @turn = style == 'random' ? [x, o].sample : x
  end

  def switch_player_turn
    @turn = @turn == @x ? @o : @x
  end
end
