# ibnaternpryakahm

require 'google/apis/sheets_v4'

OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'.freeze
APPLICATION_NAME = 'Alfred'.freeze
CREDENTIALS_PATH = 'storage/credentials.json'.freeze
# The file token.yaml stores the user's access and refresh tokens, and is
# created automatically when the authorization flow completes for the first
# time.
TOKEN_PATH = 'token.yaml'.freeze
SCOPE = [Google::Apis::SheetsV4::AUTH_SPREADSHEETS_READONLY]

##
# Ensure valid credentials, either by restoring from the saved credentials
# files or intitiating an OAuth2 authorization. If authorization is required,
# the user's default browser will be launched to approve the request.
#
# @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
authorize = Google::Auth::ServiceAccountCredentials.make_creds(json_key_io: File.open(CREDENTIALS_PATH),
                                                               scope: SCOPE)
authorize.fetch_access_token!
# Connect to Google
service = Google::Apis::SheetsV4::SheetsService.new
service.client_options.application_name = 'Alfred'
service.authorization = authorize

spreadsheet_id = "1ov-_HcZTn-8c4zQiCa3OYW6rgwtY6KdxL1W9zFiLSI4"
range = 'Test!A2:S4'
response = service.get_spreadsheet_values(spreadsheet_id, range)
puts "No data found." if response.values.empty?
response.values.each do |row|
  # Print columns A and E, which correspond to indices 0 and 4.
  row.each do |value|
    p value
  end
end