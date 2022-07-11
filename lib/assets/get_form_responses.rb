# frozen_string_literal: true

require 'google/apis/sheets_v4'



APPLICATION_NAME = 'Alfred'.freeze
def credentials
  cred = Rails.application.credentials.google
  @credentials ||= {
    type: 'service_account',
    project_id: cred.project_id,
    private_key_id: cred[:private_key_id],
    private_key: cred[:private_key],
    client_email: cred[:client_email],
    client_id: cred[:client_id],
    auth_uri: 'https://accounts.google.com/o/oauth2/auth',
    token_uri: 'https://oauth2.googleapis.com/token',
    auth_provider_x509_cert_url: 'https://www.googleapis.com/oauth2/v1/certs',
    client_x509_cert_url: cred[:client_x509_cert_url]
  }.to_json
end


SCOPE = [Google::Apis::SheetsV4::AUTH_SPREADSHEETS_READONLY].freeze

##
# Ensure valid credentials, either by restoring from the saved credentials
# files or intitiating an OAuth2 authorization. If authorization is required,
# the user's default browser will be launched to approve the request.



def retrieve_responses
  authorize = Google::Auth::ServiceAccountCredentials.make_creds(json_key_io: StringIO.new(credentials),

                                                                 scope: SCOPE)
  # Connect to Google
  service = Google::Apis::SheetsV4::SheetsService.new
  service.client_options.application_name = APPLICATION_NAME
  service.authorization = authorize

  spreadsheet_id = '1-8RrxQOmMFmJucsUzPmVHcp3Gtr2WfvkG4KldmPDhLE'
  range = 'Flow!A:R'

  service.get_spreadsheet_values(spreadsheet_id, range).values
end

def parse_responses(responses)
  questions_hash = {
    activity_name: nil,
    activity_category: nil,
    skill_level: nil,
    challenge_level: nil,
    feeling_competent: nil,
    mentally_absorbed: nil,
    clear_objectives: nil,
    control_situation: nil,
    free_from_ego: nil,
    free_from_time: nil,
    clear_conditions: nil,
    great_experience: nil,
    is_voluntary: nil,
    energy_level: nil,
    happiness_level: nil,
    social_quality: nil
  }
  responses_hash = {}
  responses[1..].each do |response|
    responses_hash[response[1].to_s] = {}
  end
  responses_hash.each do |id, user_hash|
    responses.select { |response_by_id| response_by_id.include?(id) }.each do |response_array|
      response_array[2..].each_with_index do |question_response, index|
        questions_hash[questions_hash.keys[index]] = question_response
      end
      user_hash[response_array[0]] = questions_hash.clone if id == response_array[1]
    end
  end
  responses_hash
end

@form_responses = parse_responses(retrieve_responses)
