def listen_to_start(bot)
  bot.command(:start, description: "Lance l'algorithme pour récupérer les informations sur ton état de flow") do |event|
    event.send_message("Début de la récolte d'informations :teddy_bear:")
    event.send_message('Tu vas recevoir un formulaire à remplir plusieurs fois dans la journée, pour que je puisse évaluer ton état de flow.')
   
    user = User.find_by(private_id: event.user.id)
    
    user.start_test
    # p user

    intervals = user.flow_test_intervals.split(' ')
    p intervals

  
    while((user.flow_testing == true))
      user = User.find_by(private_id: event.user.id)
      
      if Time.parse(intervals[0]) < Time.now
        event.send_message('link')
        intervals = intervals.drop(1) 
        user.update(:flow_test_intervals => intervals)
        user = User.find_by(private_id: event.user.id)
        p user
        intervals = user.flow_test_intervals.split(' ')

      end
    end
    event.send_message('fin test flow.')
    
  end

end
# URL formulaire avec id pré_rempli:
#https://formfacade.com/public/104841687575539744272/all/form/1FAIpQLSdiyPte2dxpCa06pXTwMsovWFbYHlBdRXN-PalOBEFArFJx2w?usp=pp_url&entry.1656198658=#{id}