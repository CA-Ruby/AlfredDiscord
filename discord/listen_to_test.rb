require File.expand_path(File.join(File.dirname(__FILE__), 'helpers/set_timezone'))

@regions_list = world_regions.map!.with_index { |w_r, i| "#{i + 1}/ #{w_r}" }

def listen_to_test(bot)
  bot.command(:test) do |event|
    event.respond('Bouton de test') do |_, view|
      view.row do |r|
        r.button(label: 'Test!', style: :primary, emoji: 577663465322315786, custom_id: 'test_button:1')
      end

      view.row do |r|
        r.select_menu(custom_id: 'test_select', placeholder: 'Select me!', max_values: 3) do |s|
          s.option(label: 'Foo', value: 'foo')
          s.option(label: 'Bar', value: 'bar')
          s.option(label: 'Baz', value: 'baz')
          s.option(label: 'Bazinga', value: 'bazinga')
        end
      end
    end
  end
end
