require "./spec_helper"
require "../src/lovely"
require "../src/lovely/wrapper"

Mocks.create_mock(Lovely::Wrapper) do
  mock wrap(text, width)
end

describe Lovely do
  describe ".wrap" do
    it "offloads the wrapping to a wrapper" do
      wrapper = Mocks.instance_double(Lovely::Wrapper,
                                      returns(wrap("Ice Ice Baby", 7),
                                              "Ice Ice\nBaby\n"))
      wrapped = Lovely.wrap("Ice Ice Baby", width: 7, wrapper: wrapper)
      expect(wrapped).must_equal("Ice Ice\nBaby\n")
    end

    it "wraps the passed String to 72 characters by default" do
      wrapper = Mocks.instance_double(Lovely::Wrapper,
                                      returns(wrap("Ice Ice Baby", 72),
                                              "Ice Ice Baby\n"))
      wrapped = Lovely.wrap("Ice Ice Baby", wrapper: wrapper)
      expect(wrapped).must_equal("Ice Ice Baby\n")
    end
  end
end
