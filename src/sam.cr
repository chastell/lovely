require "sam"

Sam.task "build" do
  `crystal build --link-flags='-static' --no-debug -o bin/lovely --release bin/lovely.cr`
end

Sam.task "format" do
  `crystal tool format`
end

Sam.help
