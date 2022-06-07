module DiscordBot
  module Stop
    extend Discordrb::Commands::CommandContainer

    command(:stop, description: "Stoppe la récolte d'informations :teddy_bear:") do |event|
      event.send_message('À bientôt !')
    end
  end
end

