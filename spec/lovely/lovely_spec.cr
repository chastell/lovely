require "../spec_helper"
require "../../src/lovely"
require "../../src/lovely/wrapper"

class TestWrapper < Lovely::Wrapper
  def wrap(text, width = 72)
    "Ice Ice\nBaby\n" if text == "Ice Ice Baby" && width == 7
  end
end

describe Lovely do
  describe ".wrap" do
    it "offloads the wrapping to a wrapper" do
      wrapped = Lovely.wrap("Ice Ice Baby", width: 7, wrapper: TestWrapper.new)
      wrapped.should eq("Ice Ice\nBaby\n")
    end
  end
end
