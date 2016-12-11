require "./spec_helper"
require "../src/lovely"

describe Lovely do
  describe ".wrap" do
    it "wraps a string to the given width" do
      wrapped = Lovely.wrap("Ice Ice Baby", width: 7)
      __(wrapped).must_equal("Ice Ice\nBaby")
    end

    it "wraps a string to 72 characters by default" do
      wrapped = Lovely.wrap("Ice Ice Baby")
      __(wrapped).must_equal("Ice Ice Baby")
    end
  end
end
