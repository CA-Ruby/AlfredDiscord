def listen_to_stop(bot)
  bot.command(:stop, description: "Stop l'algorithme pour récupérer les informations sur ton état de flow") do |event|
    user = User.find_by(private_id: event.user.id)
    user.stop_test
    event.send_message("Fin de la récolte d'informations, merci !")
  end
end
