require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Board do
  DEAD_GRID         = [%w[. . .],
                       %w[. . .],
                       %w[. . .]]
  THREE_LIVING_GRID = [%w[x x x],
                       %w[. . .],
                       %w[. . .]]

  subject { Board.new(DEAD_GRID) }

  describe ".new" do
    it "it taks an array as it's argument" do
      expect { Board.new([]) }.to_not raise_error
    end
  end

  describe "#evolve" do
    context "uses the rules of Conway's Game of Life to evolve the board to the next generation" do
      context "with all cells dead" do
        subject { Board.new(DEAD_GRID).tap(&:evolve) }
        its(:grid) { should == DEAD_GRID }
      end

      context "with 3 cells living at the top" do
        subject { Board.new(THREE_LIVING_GRID).tap(&:evolve) }
        its(:grid) { should == [%w[. . .],
                                %w[. x .],
                                %w[. . .]]}
      end
    end
  end

  describe "#grid" do
    it "returns an array representing the currend board" do
      subject.grid.should == DEAD_GRID
    end
  end

  describe "#width" do
    its(:width) { should == 2 }
  end

  describe "#height" do
    its(:height) { should == 2 }
  end

  describe "#kill?" do
    context "living cell with 0 neighbors dies" do
      subject { Board.new(   [%w[x x x],
                              %w[. . .],
                              %w[. . .]])}
      it { subject.kill?(0,0).should be_true }
      it { subject.kill?(0,1).should be_true }
      it { subject.kill?(0,2).should be_true }
      it { subject.kill?(1,0).should be_true }
      it { subject.kill?(1,1).should be_true }
      it { subject.kill?(1,2).should be_true }
      it { subject.kill?(2,0).should be_true }
      it { subject.kill?(2,1).should be_true }
      it { subject.kill?(2,2).should be_true }
    end
  end

  describe "#kill" do
    subject { Board.new(THREE_LIVING_GRID).tap { |board| board.kill(0,1) } }
    its(:grid) { should == [%w[x . x],
                            %w[. . .],
                            %w[. . .]]}
  end
end
