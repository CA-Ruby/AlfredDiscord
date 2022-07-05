# frozen_string_literal: true

def listen_to_link(bot)
  bot.command(:link, description: 'Envoie le lien pour accéder aux résultats') do |event|
    user = User.find_by(private_id: event.user.id)
    flow_entries = FlowEntry.where(user: user).order(created_at: :desc)
    flow_entries_by_day = FlowEntry.where(user: user).order(created_at: :desc).group_by { |t| t.created_at.to_date }

    if flow_entries_by_day.count < 2 || flow_entries.count < 10
      event.send_message('Tu auras accès à tes résultats après 10 réponses sur 2 jours minimum.')
    else
      event.send_message("Voici le lien pour accéder à tes résultats: https://alfrediscord.herokuapp.com/flow_entries/#{user.private_id}")
    end
    nil
  end
end