module DiscordBot
  module Ping
    extend Discordrb::Commands::CommandContainer

    command(:ping) do
      'pong'
    end
  end
end