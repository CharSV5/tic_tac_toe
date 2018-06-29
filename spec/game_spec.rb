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

end
