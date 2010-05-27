Given /^the following setup$/ do |table|
  Grid.new([table.headers] + table.rows)
end

When /^I evolve the board$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the center cell should be dead$/ do
  pending # express the regexp above with the code you wish you had
end