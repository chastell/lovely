require "minitest/autorun"

module Minitest
  class Spec < Test
    def __(value)
      expect(value)
    end
  end
end
