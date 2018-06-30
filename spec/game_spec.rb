require 'game'

describe 'Game' do
  subject { Game.new }
  before(:each) do
    subject.create_board
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
      subject.start_game('player x first')
      subject.switch_player_turn
      expect(subject.turn).to eq subject.o
    end
  end
  describe '#create_board' do
    it 'creates a new board' do
      expect(subject.board).to be_a Board
    end
  end
  describe '#create_combinations' do
    it 'creates all the different winning combinations' do
      subject.start_game('player x first')
      subject.x.record_play(3)
      subject.x.record_play(7)
      subject.x.record_play(9)
      subject.x.record_play(1)
      expect(subject.create_combinations).to eq [[3, 7, 1],
        [3, 7, 9], [3, 9, 1], [7, 9, 1]]
    end
  end
end
