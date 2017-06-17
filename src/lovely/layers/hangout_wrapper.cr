require "./basic_wrapper"
require "./layer"

module Lovely
  module Layers
    class HangoutWrapper < Layer
      private SPACE = /\p{Zs}/

      def call(@text, @width)
        final = hangout_line ? rewrapped : text
        next_layer.call(final.tr(NBSP.to_s, " "), width)
      end

      private def hangout?(line, context, verify = false)
        return false unless line_last_space = line.rindex(SPACE)
        return line_last_space >= context.size unless verify
        glued = line[(line_last_space + 1)..-1] + ' ' + context
        glued.rindex(SPACE).not_nil! < line_last_space
      end

      private def hangout_line
        text.lines.each_cons(2).with_index do |(upper, lower), index|
          if index == text.lines.size - 2
            return index if hangout?(line: upper, context: lower, verify: true)
          else
            return index     if hangout?(line: upper, context: lower)
            return index + 1 if hangout?(line: lower, context: upper)
          end
        end
      end

      private def rewrapped
        return text unless index = hangout_line
        new_lines = text.lines.map_with_index do |line, i|
          glue = i == index ? NBSP : ' '
          line + glue
        end
        wrapped = BasicWrapper.new.call(new_lines.join, width)
        HangoutWrapper.new.call(wrapped, width)
      end
    end
  end
end
