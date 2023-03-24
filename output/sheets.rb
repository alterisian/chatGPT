

Example of using the Google Sheets API v4 with Ruby:

require 'google/apis/sheets_v4'

# Authorizes with OAuth and gets an access token
sheets = Google::Apis::SheetsV4::SheetsService.new
sheets.authorization = Google::Auth.get_application_default(['https://www.googleapis.com/auth/spreadsheets.readonly'])

# Retrieves Spreadsheet
spreadsheet_id = 'your-unique-spreadsheet-id'
response = sheets.get_spreadsheet_values(spreadsheet_id,
                                        'Sheet1!A1:X10')

# Prints the first 6 columns of the first 10 rows
response.values[0..9].each do | row |
  puts row.take(6).join("\t")
end