task :build do
  `crystal build --link-flags='-static' --no-debug -o bin/lovely --release bin/lovely.cr`
end

task :format do
  `crystal tool format`
end
