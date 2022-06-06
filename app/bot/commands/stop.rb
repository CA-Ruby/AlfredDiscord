module DiscordBot
  module Stop
    extend Discordrb::Commands::CommandContainer

    command(:stop) do |event|
      event.send_message('À bientôt !')
          
    end
  end
end

