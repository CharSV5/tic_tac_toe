class Board
  attr_reader :grid, :combinations
  def initialize
    @grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    winning_combinations
  end

  def winning_combinations
    @combinations = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8],
                     [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  end
end
