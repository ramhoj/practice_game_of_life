class Board
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def evolve
    (0..width).each do |row|
      (0..width).each do |cell|
        determine(row, cell)
      end
    end
  end

  def determine(row, cell)
    if kill?(row, cell)
      kill(row, cell)
    elsif awake?(row, cell)
      awake(row, cell)
    end
  end

  def kill?(row, cell)
    true
  end

  def kill(row, cell)
    puts "killing #{row}, #{cell} from #{caller.join("\n")}"
    @grid[row][cell] = "."
  end

  def width
    @grid.length - 1
  end
  alias :height :width
end