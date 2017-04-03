require "./basic_wrapper"
require "./layer"

module Lovely
  module Layers
    class HangoutWrapper < Layer
      def call(@text, @width)
        final = hangout_line ? rewrapped : text
        next_layer.call(final, width)
      end

      private getter text = "", width = 72

      private def hangout_line
        text.lines.each_cons(2).with_index do |(upper, lower), index|
          finder = HangoutFinder.new(upper, lower, index == text.lines.size - 2)
          return index if finder.hangout?
        end
      end

      private def rewrapped
        return text unless index = hangout_line
        new_lines = text.lines
        new_lines[index] = new_lines[index] + ' '
        wrapped = BasicWrapper.new.call(new_lines.join, width)
        HangoutWrapper.new.call(wrapped, width)
      end

      private class HangoutFinder
        def initialize(@upper : String, @lower : String, @last : Bool)
        end

        def hangout?
          exists? && useful_fix?
        end

        private getter upper, lower

        private def exists?
          last_space = upper.rindex(/\p{Zs}/)
          last_space && last_space >= lower.size
        end

        private def last?
          @last
        end

        private def useful_fix?
          return true unless last?
          return true unless cut = upper.rindex(/\p{Zs}/)
          final = upper[(cut + 1)..-1] + ' ' + lower
          last_space = final.rindex(/\p{Zs}/)
          last_space && last_space <= cut
        end
      end
    end
  end
end
