require_relative('../lib/assets/get_form_responses')

@form_responses = @form_responses.reject { |id| User.where(id: id).empty? }

def upload_responses(responses)
  responses.each do |id, user_hash|
    flow_entry = nil
    user_hash.each do |datetime, responses_hash|
      flow_entry = FlowEntry.new
      responses_hash.each do |attribute, value|
        flow_entry[attribute] = value
      end
      flow_entry.created_at = datetime
      flow_entry.user_id = id
      flow_entry.save unless FlowEntry.find_by(created_at: flow_entry.created_at)
    end
  end
end

def listen_to_stop(bot)
  bot.command(:stop, description: "Stop l'algorithme pour récupérer les informations sur ton état de flow") do |event|
    user = User.find_by(private_id: event.user.id)
    upload_responses(@form_responses)
    user.stop_test
    event.send_message("Fin de la récolte d'informations, merci !")
  end
end
