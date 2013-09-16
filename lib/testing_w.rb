require 'date'
def parse_podcast_name(path)
	# we only allow the second layer such as show/podcast.mp3
	allow_path = 1
	while path.index('/') != nil do
		i = path.index('/')+1
		path = path[i..path.length]
		allow_path = allow_path + 1
	end
	if allow_path == 3
		rev_path = path.reverse
		if rev_path.index('.').nil?
			i = 0
		else
			i = rev_path.index('.')+1
		end
		new_path = rev_path[i..rev_path.length]

		file_Name = new_path.reverse
		possible_Date = new_path[0..9].reverse

		month = possible_Date[0..1]
		day = possible_Date[3..4]
		year = possible_Date[6..9]

		possible_Date = year.to_s+'-'+month.to_s+'-'+day.to_s
		if Date._parse(possible_Date)[:year].nil? or Date._parse(possible_Date)[:mon].nil? or Date._parse(possible_Date)[:mday].nil?
			file_Date = nil
		else
			file_Date = Date.strptime(possible_Date, '%Y-%m-%d')
		end
		file = Hash.new
		file = {:file_Name => file_Name, :file_Date => file_Date }
		return file
	else
		return false
	end
end

# example to use it
require 'dropbox_sdk'

# APP_KEY = 'xs74qq784d9t162'
# APP_SECRET = '06jeldwww4n7kl1'

# flow = DropboxOAuth2FlowNoRedirect.new(APP_KEY, APP_SECRET)
# authorize_url = flow.start()
# puts '1. Go to: ' + authorize_url

# code = 'FFZJu yXCiigAAAAAAAAAAUm2fCVtTZKWl8gqgez0gUc'
# # This will fail if the user gave us an invalid authorization code
# access_token, user_id = flow.finish(code)
access_token="e0N242rOgW4AAAAAAAAAAWFQJ8kNlomQH5oZj7Sb5RkrKA8CNEFKCnTT9cup5_SQ"
client = DropboxClient.new(access_token)
#puts "linked account:", client.account_info().inspect

prev_delta = client.delta()
prev_cursor = prev_delta['cursor']

prev_delta['entries'].each do |e|
	puts e[1]['path']
	puts parse_podcast_name(e[1]['path'])
end