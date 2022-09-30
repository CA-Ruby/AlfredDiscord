# frozen_string_literal: true

require File.expand_path(File.join(File.dirname(__FILE__), './get_form_responses'))

def upload_responses
  @form_responses = parse_responses(retrieve_responses)
  @form_responses = @form_responses.reject { |id| User.where(private_id: id).empty? }
  unless FlowEntry.all.size.zero?
    @form_responses.transform_values!{ |hash| hash.reject! { |datetime, d_hash| datetime.to_datetime <= FlowEntry.last.created_at }  }
  end
  puts @form_responses
  @form_responses.each do |id, user_hash|
    flow_entry = nil
    user_hash.each do |datetime, responses_hash|
      flow_entry = FlowEntry.new
      responses_hash.each do |attribute, value|
        flow_entry[attribute] = value
      end
      flow_entry.created_at = datetime
      flow_entry.user_id = User.find_by(private_id: id).id
      next if FlowEntry.find_by(created_at: flow_entry.created_at)

      puts "Uploaded" if flow_entry.save
    end
  end
end
