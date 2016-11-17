require "./spec_helper"
require "../src/lovely"

Mocks.create_double("Wrapper") do
  mock wrap(text, width).as(String)
end

describe Lovely do
  describe ".wrap" do
    it "offloads the wrapping to a wrapper" do
      wrapper = Mocks.double("Wrapper", returns(wrap("Ice Ice Baby", 7),
                                                "Ice Ice\nBaby\n"))
      wrapped = Lovely.wrap("Ice Ice Baby", width: 7, wrapper: wrapper)
      expect(wrapped).must_equal("Ice Ice\nBaby\n")
    end

    it "wraps the passed String to 72 characters by default" do
      wrapper = Mocks.double("Wrapper", returns(wrap("Ice Ice Baby", 72),
                                                "Ice Ice Baby\n"))
      wrapped = Lovely.wrap("Ice Ice Baby", wrapper: wrapper)
      expect(wrapped).must_equal("Ice Ice Baby\n")
    end
  end
end
