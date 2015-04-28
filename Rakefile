require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.options = '-v'
  t.libs << %w(lib)
  t.test_files = FileList['test/**/test_*.rb']
end

task :default => :test
