# frozen_string_literal: true

require File.expand_path(File.join(File.dirname(__FILE__), '../../lib/assets/get_form_responses'))

@form_responses = @form_responses.reject { |id| User.where(private_id: id).empty? }

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
      flow_entry.save unless FlowEntry.find_by(created_at: flow_entry.created_at)
    end
  end
end
