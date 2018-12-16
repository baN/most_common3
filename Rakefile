require 'rake/testtask'


Rake::TestTask.new(:test) do |t|
  t.pattern = 'test/**/*_test.rb'
end

Rake::TestTask.new(:bench) do |t|
  t.pattern = 'test/**/*_benchmark.rb'
end

task default: :test