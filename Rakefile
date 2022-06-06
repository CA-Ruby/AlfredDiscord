# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks
loader = Zeitwerk::Loader.for_gem
loader.push_dir("#{File.dirname(__FILE__)}/config/initializers")
loader.setup


task :bot do
  DiscordBot.run
end