def listen_to_start(bot)
  bot.command(:start, description: "Lance l'algorithme pour récupérer les informations sur ton état de flow") do |event|
    event.send_message("Début de la récolte d'informations :teddy_bear:")
    event.send_message('Tu vas recevoir un formulaire à remplir plusieurs fois dans la journée, pour que je puisse évaluer ton état de flow.')
    user = User.find(event.user.id)
    
    user.start_test
    p user
    bot.add_await!(Discordrb::Events::MessageEvent) { |message| message.content == '!stop' }
    
    user.stop_test
    p user 
    
    event.send_message("Fin de la récolte d'informations, merci !")
   
  end
end
# URL formulaire avec id pré_rempli:
#https://formfacade.com/public/104841687575539744272/all/form/1FAIpQLSdiyPte2dxpCa06pXTwMsovWFbYHlBdRXN-PalOBEFArFJx2w?usp=pp_url&entry.1656198658=#{id}