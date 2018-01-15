require "./lovely/wrapper"

module Lovely
  def self.wrap(text, width = 72, wrapper = Wrapper.new)
    wrapper.call(text, width: width)
  end
end

# backport of https://github.com/crystal-lang/crystal/pull/5350
class String
  private def gsub_ascii_char(char, replacement)
    String.new(bytesize) do |buffer|
      to_slice.each_with_index do |byte, i|
        if char.ord == byte
          buffer[i] = replacement.ord.to_u8
        else
          buffer[i] = byte
        end
      end
      {bytesize, bytesize}
    end
  end
end
