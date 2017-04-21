require "yaml"
require "../spec_helper"
require "../../src/lovely/wrapper"

module Lovely
  struct Wrap
    YAML.mapping(input: String, output: String,
                  width: { default: 72, type: Int32 })
  end

  describe Wrapper do
    describe "#call" do
      it "wraps a string to the given number of characters (72 by default)" do
        short = "all right: stop, collaborate and listen"
        long  = short + " – Ice is back with a brand new invention"
        wrap  = <<-end
          all right: stop, collaborate and listen
          – Ice is back with a brand new invention
          end
        Wrapper.new.call(short).should eq short
        Wrapper.new.call(long, width: 40).should eq wrap
      end

      it "wraps the passed String to the given number of characters" do
        input = "something grabs a hold of me tightly; " \
          "flow like a harpoon – daily and nightly"
        Wrapper.new.call(input, width: 40).should eq <<-end
          something grabs a hold of me tightly;
          flow like a harpoon – daily and nightly
          end
        Wrapper.new.call(input, width: 21).should eq <<-end
          something grabs
          a hold of me tightly;
          flow like a harpoon
          – daily and nightly
          end
      end

      it "rewraps a String from zero" do
        broken = <<-end
          turn off
          the lights and I’ll glow
          end
        wrapped = Wrapper.new.call(broken)
        wrapped.should eq "turn off the lights and I’ll glow"
      end

      it "supports all the example use-cases" do
        path = File.expand_path("wrapper_spec.yml", __DIR__)
        YAML.parse(File.open(path)).each do |spec|
          wrap   = Wrap.from_yaml(spec.to_yaml)
          output = wrap.output
          Wrapper.new.call(wrap.input, width: wrap.width).should eq output
        end
      end
    end
  end
end
