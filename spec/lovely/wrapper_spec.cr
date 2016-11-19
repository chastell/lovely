require "../spec_helper"
require "../../src/lovely/wrapper"

module Lovely
  describe Wrapper do
    describe "#wrap" do
      it "wraps the passed String to the given number of characters" do
        short = "all right: stop, collaborate and listen"
        long  = short + " – Ice is back with a brand new invention"
        wrap  = <<-end
          all right: stop, collaborate and listen
          – Ice is back with a brand new invention

          end
        expect(Wrapper.new.wrap(short, 72)).must_equal "#{short}\n"
        expect(Wrapper.new.wrap(long, 40)).must_equal wrap
      end
    end
  end
end
