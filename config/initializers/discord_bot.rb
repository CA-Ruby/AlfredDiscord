module DiscordBot
  throw 'Lacking required secrets!' unless Rails.application.credentials.discord[:token] && 
                                           Rails.application.credentials.discord[:client_id]

  require './app/bot/commands/ping.rb'
  require './app/bot/commands/start.rb'
  require './app/bot/commands/stop.rb'

  BOT = Discordrb::Commands::CommandBot.new(
    token: Rails.application.credentials.discord[:token],
    client_id: Rails.application.credentials.discord[:client_id],
    prefix: '!'
  )

  puts "This bot's invite URL is #{BOT.invite_url}"
  puts 'Click on it to invite it to your server'

  commands = [
    DiscordBot::Ping,
    DiscordBot::Start,
    DiscordBot::Stop,
  ]
  commands.each { |command| BOT.include!(command) }

  def self.run
    BOT.run
  end

  def self.invite_url
    BOT.invite_url
  end
end
