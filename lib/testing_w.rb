# require 'dropbox_sdk'

# APP_KEY = 'xs74qq784d9t162'
# APP_SECRET = '06jeldwww4n7kl1'

# flow = DropboxOAuth2FlowNoRedirect.new(APP_KEY, APP_SECRET)
# authorize_url = flow.start()
# puts '1. Go to: ' + authorize_url

# code = 'FFZJuyXCiigAAAAAAAAAAUm2fCVtTZKWl8gqgez0gUc'
# # This will fail if the user gave us an invalid authorization code
# access_token, user_id = flow.finish(code)
access_token="e0N242rOgW4AAAAAAAAAAWFQJ8kNlomQH5oZj7Sb5RkrKA8CNEFKCnTT9cup5_SQ"
client = DropboxClient.new(access_token)
#puts "linked account:", client.account_info().inspect

prev_delta = client.delta()
prev_cursor = prev_delta['cursor']
#puts prev_cursor.to_s
puts prev_delta['entries']