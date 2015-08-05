require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

task :default => [:spec]

desc 'Run all tests.'
task :spec => ['clean', 'rundock', 'serverspec']

desc 'Cleaning environments'

task :clean do
  Bundler.with_clean_env do
    system 'rm -f /var/tmp/hello_rundock*'
  end
end

desc "Run rundock-itamae plugin"

task :rundock do
  cmd = 'bundle exec rundock do ./spec/integration/scenario.yml -l debug'
  puts "[EXEC: ] #{cmd}"
  system cmd
end

desc "Run serverspec tests"

RSpec::Core::RakeTask.new(:serverspec) do |t|
    ENV['TARGET_HOST'] = 'localhost'
    t.ruby_opts = '-I ./spec/integration'
    t.pattern = ['./spec/integration/recipes/*_spec.rb']
end
