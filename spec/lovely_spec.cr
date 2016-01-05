require "./spec_helper"
require "../src/lovely"
require "../src/lovely/wrapper"

class TestWrapper < Lovely::Wrapper
  def wrap(text, width = raise)
    case
    when text == "Ice Ice Baby" && width == 7  then "Ice Ice\nBaby\n"
    when text == "Ice Ice Baby" && width == 72 then "Ice Ice Baby\n"
    end
  end
end

describe Lovely do
  describe "Lovely.wrap" do
    it "offloads the wrapping to a wrapper" do
      wrapped = Lovely.wrap("Ice Ice Baby", width: 7, wrapper: TestWrapper.new)
      expect(wrapped).must_equal("Ice Ice\nBaby\n")
    end

    it "wraps the passed String to 72 characters by default" do
      wrapped = Lovely.wrap("Ice Ice Baby", wrapper: TestWrapper.new)
      expect(wrapped).must_equal("Ice Ice Baby\n")
    end
  end
end
