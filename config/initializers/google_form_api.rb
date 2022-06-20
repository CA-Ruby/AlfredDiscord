# require 'google/apis/forms_v1'
# require 'net/http'

# forms = Google::Apis::FormsV1::FormResponse.new

# forms.form_id = '15Ct84Em_tryss1aaAwtreKtUE73s4A62qL8ZKa_BG-U'

# puts forms
# form_url = URI("https://docs.google.com/forms/d/15Ct84Em_tryss1aaAwtreKtUE73s4A62qL8ZKa_BG-U/edit#responses")

# puts form_url
# puts Net::HTTP.get(form_url)

# ibnaternpryakahm

require 'google/apis/forms_v1'
require 'googleauth'
# Connect to Google
service = Google::Apis::FormsV1::FormsService.new
service.client_options.application_name = 'Alfred'
# service.authorization = Google::Auth::ServiceAccountCredentials.make_creds(json_key_io: File.open('client_secret.json'),
#                                                                            scope: Google::Apis::FormsV1::AUTH_SPREADSHEETS_READONLY)
# Query the form
form_id = '15Ct84Em_tryss1aaAwtreKtUE73s4A62qL8ZKa_BG-U'
puts service