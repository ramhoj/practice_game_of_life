require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Grid do
  describe ".new" do
    it "has an initializer" do
      expect { Grid.new }.to_not raise_error(NoMethodError)
    end

    it "it taks an array as it's argument" do
      expect { Grid.new([]) }.to_not raise_error(ArgumentError)
    end
  end
end
