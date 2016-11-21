module Lovely
  class Wrapper
    def call(text, width)
      text.gsub(/(.{1,#{width}})( |$\n?)/, "\\1\n")
    end
  end
end
