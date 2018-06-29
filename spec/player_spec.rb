require 'player'

describe Player do
  # let(:board) { double('board', :grid => [1, 2, 3, 4, 5, 6, 7, 8, 9]) }
  subject = Player.new('x', Board.new)
  describe '#play' do
    before (:each) do
      p subject.board.grid
      subject.play(3)
    end

    it 'lets a player play a turn' do
      expect(subject.board.grid).to eq [1, 2, 'x', 4, 5, 6, 7, 8, 9]
    end
    context 'player tries to play same field twice'
    it 'returns nil' do
      expect(subject.play(3)).to eq nil
    end
  end
end
