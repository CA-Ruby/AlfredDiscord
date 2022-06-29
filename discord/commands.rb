require File.expand_path('../config/environment', __dir__)

require 'discordrb'


Dir["/Users/wilfriedmoffen/Documents/AlfredDiscord/discord/*"].each {|file| require file unless file.include? 'commands.rb'}


bot = Discordrb::Commands::CommandBot.new(
    token: Rails.application.credentials.discord[:token],
    client_id: Rails.application.credentials.discord[:client_id],
    prefix: '!'
  )


listen_to_hello(bot)
listen_to_ping(bot)
listen_to_start(bot)

bot.run


# module DiscordBot
#     module Auto_msg
#         extend Discordrb::Commands::CommandContainer
#         command(:auto, description: 'Permet de tester que je fonctionne bien') do |event|
#             event.respond "Hi, #{event.user}!"
#             event.respond "Hi, #{event.user.discriminator}!"
#             event.respond "Hi, #{event.user.bot_account}!"
#             event.respond "Hi, #{event.user.username}!"
#         end
#     end
# end