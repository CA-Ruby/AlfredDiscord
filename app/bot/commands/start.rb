module DiscordBot
  module Start
    extend Discordrb::Commands::CommandContainer

    command(:start) do |event|
      event.send_message('Comment te sens-tu sur une échelle de 1 à 5 ?')
          
    end
  end
end

