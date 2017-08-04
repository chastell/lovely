require "../src/lovely/cli"

Lovely::CLI.new(ARGV, input: STDIN, output: STDOUT).wrap
