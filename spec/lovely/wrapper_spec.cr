require "../spec_helper"
require "../../src/lovely/wrapper"

module Lovely
  describe Wrapper do
    describe "#call" do
      it "wraps the passed String to the given number of characters" do
        short = "all right: stop, collaborate and listen"
        long  = short + " – Ice is back with a brand new invention"
        wrap  = <<-end
          all right: stop, collaborate and listen
          – Ice is back with a brand new invention

          end
        __(Wrapper.new.call(short, 72)).must_equal "#{short}\n"
        __(Wrapper.new.call(long, 40)).must_equal wrap
      end

      it "wraps the passed String to the given number of characters" do
        input = "something grabs a hold of me tightly; " \
          "flow like a harpoon – daily and nightly"
        __(Wrapper.new.call(input, width: 40)).must_equal <<-end
          something grabs a hold of me tightly;
          flow like a harpoon – daily and nightly

          end
        __(Wrapper.new.call(input, width: 21)).must_equal <<-end
          something grabs a
          hold of me tightly;
          flow like a harpoon –
          daily and nightly

          end
      end
    end
  end
end
