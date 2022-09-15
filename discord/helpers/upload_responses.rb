# frozen_string_literal: true

require File.expand_path(File.join(File.dirname(__FILE__), '../../lib/assets/get_form_responses'))

@form_responses = @form_responses.reject { |id| User.where(private_id: id).empty? }
@form_responses.transform_values!{ |hash| hash.reject! { |datetime, d_hash| datetime.to_datetime <= FlowEntry.last.created_at }  }

def upload_responses(responses)
  responses.each do |id, user_hash|
    flow_entry = nil
    user_hash.each do |datetime, responses_hash|
      flow_entry = FlowEntry.new
      responses_hash.each do |attribute, value|
        flow_entry[attribute] = value
      end
      flow_entry.created_at = datetime
      flow_entry.user_id = User.find_by(private_id: id).id
      next if FlowEntry.find_by(created_at: flow_entry.created_at)

      flow_entry.save
      puts "Uploaded"
    end
  end
end
