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
  before(:each) do
    subject.start_game('player x first')
    subject.turn.play(3)
    subject.turn.play(7)
    subject.turn.play(9)
    subject.turn.play(1)
  end
  describe '#create_combinations' do
    it 'creates all the different winning combinations' do
      expect(subject.create_combinations).to eq [[1, 3, 7],
                                                 [1, 3, 9], [1, 7, 9], [3, 7, 9]]
    end
  end
  describe 'winner?' do
    it 'knows if someone has not won' do
      expect(subject.winner?).to eq false
    end
    it 'knows if someone has won' do
      subject.turn.play(2)
      expect(subject.winner?).to eq true
    end
  end
  describe 'draw?' do
    it 'knows if the game is a draw' do
      subject.turn.play(5)
      subject.turn.play(2)
      subject.turn.play(4)
      subject.turn.play(6)
      subject.turn.play(8)
      expect(subject.draw?).to be true
    end
  end
end
