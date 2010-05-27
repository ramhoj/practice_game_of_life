Given /^the following setup$/ do |table|
  @board = Board.new([table.headers] + table.rows)
end

When /^I evolve the board$/ do
  @board.evolve
end

Then /^the center cell should be dead$/ do
  @board.grid[1][1].should == "."
end

Then /^the center cell should be alive$/ do
  @board.grid[1][1].should == "x"
end