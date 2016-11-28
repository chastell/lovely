module Lovely
  class Wrapper
    def call(text, width)
      text.tr("\n", " ").strip.gsub(/(.{1,#{width}})( |$\n?)/, "\\1\n")
    end
  end
end
