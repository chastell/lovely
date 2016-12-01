module Lovely
  class Wrapper
    def call(text, width = 72)
      text.tr("\n", " ").strip.gsub(/(.{1,#{width}})( |$\n?)/, "\\1\n")
    end
  end
end
