require 'date'
def parse_podcast_name(path)	
	while path.index('/') != nil do
		i = path.index('/')+1
		path = path[i..path.length]
	end

	rev_path = path.reverse
	if rev_path.index('.').nil?
		i = 0
	else
		i = rev_path.index('.')+1
	end
	new_path = rev_path[i..rev_path.length]

	file_Name = new_path.reverse
	possible_Date = new_path[0..9].reverse

	# if Date.strptime(possible_Date, '%Y-%m-%d')
	# 	file_Date = nil
	# else
	# 	file_Date = Date.strptime(possible_Date, '%Y-%m-%d')
	# end
	return Date._parse('abc')[:year]
end

require 'dropbox_sdk'

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
#puts prev_cursor
#puts prev_cursor.to_s
prev_delta['entries'].each do |e|
	#puts e[1]['path']	
	puts parse_podcast_name(e[1]['path'])
end