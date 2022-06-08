module DiscordBot
  module Ping
    extend Discordrb::Commands::CommandContainer

    command(:ping, description: 'Permet de tester que je fonctionne bien') do
      'pong'
    end
  end
end