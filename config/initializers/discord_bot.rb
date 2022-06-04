module DiscordBot
  throw 'Lacking required secrets!' unless Rails.application.credentials.discord[:token] && Rails.application.credentials.discord[:client_id]

  @bot = Discordrb::Commands::CommandBot.new(
    token: Rails.application.credentials.discord[:token],
    client_id: Rails.application.credentials.discord[:client_id],
    prefix: '!'
  )

  puts "This bot's invite URL is #{@bot.invite_url}"
  puts 'Click on it to invite it to your server'

  @bot.command(:ping) do |event|
    event.respond('pong!')
  end

  def self.run
    @bot.run
  end

  def self.invite_url
    @bot.invite_url
  end
end
