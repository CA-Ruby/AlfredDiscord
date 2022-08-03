require File.expand_path(File.join(File.dirname(__FILE__), 'helpers/set_timezone'))

@regions_list = world_regions


def listen_to_test(bot)
  bot.command(:test) do |event|
    event.channel.send_embed do |embed, view|
      embed.title = 'Dans quelle région vis-tu ?'
      embed.description = 'Sélectionne dans la liste ci-dessous'

      view.row do |r|
        r.select_menu(custom_id: 'test_select', placeholder: 'Select me!', min_values: 1, max_values: 1) do |s|
          @regions_list.each do |region|
            s.option(label: region, value: region)
          end
        end
      end
    end
  end
  bot.select_menu(custom_id: 'test_select') do |event|
    event.respond(content: "You selected: #{event.values.join(', ')}")
    event.channel.send_embed do |embed, view|
      embed.title = 'Sur quel fuseau horaire te situes-tu ?'
      embed.description = 'Sélectionne dans la liste ci-dessous'

      view.row do |r|
        r.select_menu(custom_id: 'test_select', placeholder: 'Select me!', min_values: 1, max_values: 1) do |s|
          zones = regions_zones(event.values.join(', '))
          zones.each do |zone|
            s.option(label: zone, value: zone)
          end
        end
      end
    end
  end
end
