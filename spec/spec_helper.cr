require "minitest/autorun"
require "mocks"

include ::Mocks::Macro

module Minitest
  class Spec < Test
    def __(value)
      expect(value)
    end
  end
end
