require_relative 'player'

class Game
  attr_reader :x, :o

  def create_players
    @x = Player.new('x')
    @o = Player.new('o')
  end
end
