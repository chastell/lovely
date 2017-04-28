require "./lovely/wrapper"

module Lovely
  NBSP = ' '

  def self.wrap(text, width = 72, wrapper = Wrapper.new)
    wrapper.call(text, width: width)
  end
end
