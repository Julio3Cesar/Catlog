pp 'Import packages...'
require 'pry'
require 'yaml'
require 'securerandom'
require 'json'
require 'sinatra' if ARGV[0].eql?('web_api')

pp 'Import all files...'
project_files = Dir["#{File.dirname(__FILE__)}/**/*.rb"]
pp project_files.select { |file| file.include?('entity') }
pp project_files.select { |file| file.include?('entity') }.map { |file| require file }
pp project_files.sort_by(&:length)
project_files.sort_by(&:length).map do |file|
  unless file.include?('initialize') ||
      file.include?('entity') || file.include?('web_api')
    pp require file
  end
end

pp "Init system #{ARGV[0]}!"
if ARGV[0].eql?('console')
  CommandLineInterface::Main.new.main()
elsif ARGV[0].eql?('web_api')
  pp 'Import web_api files...'
  pp project_files.select { |file| file.include?('web_api') }
  pp project_files.select { |file| file.include?('web_api') }.map { |file| require file }
else
  pp 'Invalid option'
end
