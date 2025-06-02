require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Run tests"
task :test => [:spec]

desc "Build and run tests"
task :build_and_test do
  puts "Building site..."
  sh "bundle exec jekyll build"
  puts "Running tests..."
  Rake::Task["test"].invoke
end