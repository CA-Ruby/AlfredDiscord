require 'google/apis/sheets_v4'

APPLICATION_NAME = 'Alfred'.freeze
CREDENTIALS_PATH = 'storage/credentials.json'.freeze

SCOPE = [Google::Apis::SheetsV4::AUTH_SPREADSHEETS_READONLY]

##
# Ensure valid credentials, either by restoring from the saved credentials
# files or intitiating an OAuth2 authorization. If authorization is required,
# the user's default browser will be launched to approve the request.

authorize = Google::Auth::ServiceAccountCredentials.make_creds(json_key_io: File.open(CREDENTIALS_PATH),
                                                               scope: SCOPE)
# Connect to Google
service = Google::Apis::SheetsV4::SheetsService.new
service.client_options.application_name = APPLICATION_NAME
service.authorization = authorize

spreadsheet_id = "1-8RrxQOmMFmJucsUzPmVHcp3Gtr2WfvkG4KldmPDhLE"
range = 'Flow!A:R'
response = service.get_spreadsheet_values(spreadsheet_id, range)
p response.values
