require 'bundler/setup'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:unit)

require 'kitchen'
desc 'Run Test Kitchen integration tests'
task :integration do
  Kitchen.logger = Kitchen.default_file_logger
  Kitchen::Config.new.instances.each do |instance|
    instance.test(:always)
  end
end

# We cannot run Test Kitchen on Travis CI yet...
namespace :travis do
  desc 'Run tests on Travis'
  task ci: ['unit']
end

desc 'Runs foodcritic linter'
task :foodcritic do
  if Gem::Version.new('1.9.2') <= Gem::Version.new(RUBY_VERSION.dup)
    sandbox = File.join(File.dirname(__FILE__), %w{tmp foodcritic cookbook})
    prepare_foodcritic_sandbox(sandbox)

    sh "foodcritic --epic-fail any #{File.dirname(sandbox)}"
  else
    puts "WARN: foodcritic run is skipped as Ruby #{RUBY_VERSION} is < 1.9.2."
  end
end

# The default rake task should just run it all
task default: %w(travis:ci integration)

private

def prepare_foodcritic_sandbox(sandbox)
  files = %w{*.md *.rb attributes libraries recipes templates}

  rm_rf sandbox
  mkdir_p sandbox
  cp_r Dir.glob("{#{files.join(',')}}"), sandbox
  puts "\n\n"
end
