# frozen_string_literal: true

require File.expand_path(File.join(File.dirname(__FILE__), 'helpers/upload_responses'))

def listen_to_stop(bot)
  bot.command(:stop, description: "Stop l'algorithme pour récupérer les informations sur ton état de flow") do |event|
    user = User.find_by(private_id: event.user.id)
    unless user.flow_testing
      event.message.author.pm("Veuillez lancer la commande start avant celle-ci s'il-vous-plaît. :teddy_bear:")
      return nil
    end
    upload_responses
    user.stop_test
    event.message.author.pm("Fin de la récolte d'informations, merci !")
  end
end
