require 'game'

describe 'Game' do
  subject { Game.new }
  before(:each) do
    subject.create_players
  end
  describe '#create_players' do
    it 'creates a new player called x' do
      expect(subject.x).to be_a Player
    end
    it 'creates a new player called o' do
      expect(subject.o).to be_a Player
    end
  end
  describe '#switch_player_turn' do
    it 'switches the turn of the player' do
      subject.start_game('player x')
      subject.switch_player_turn
      expect(subject.turn).to eq subject.o
    end
  end
  describe '#create_board' do
    it 'creates a new board' do
      subject.create_board
      expect(subject.board).to be_a Board
    end
  end
end
