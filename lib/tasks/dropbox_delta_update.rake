namespace :justcast do
	# to call the task with parameters
	# rake 'justcast:dropbox_delta_update[josh, hello]'
	desc "Check delta from dropbox and create audiopost"
	task :dropbox_delta_update, [:delta_array] => [:environment] do |t, args|
		delta_array = args[:delta_array]

		delta_array.each do |d|
			user_email = d['user_email']
			user = User.find_by_email(user_email)			
			station_name = d['station_name']
			if user.stations.find_by_name(station_name).nil?
				# New Station
				puts "The station: #{station_name} does not exisit, Let's create it."
				station = Station.create!(:name=>station_name, :user_id=>user.id)
				if d['show_name'].nil?
					puts "No other thing to create."
				else
					#New Show
					show_name = d['show_name']
					puts "The show: #{show_name} does not exisit, Let's create it."
					show = station.shows.create!(:name=>show_name, :djname=>nil, :description=>nil, :category=>nil, :show_url=>nil, :user_id=>user.id)
					if d['audiopost_name'].nil?
						puts "No other thing to create"
					else
						#New audiopost
						audiopost_name = d['audiopost_name']
						audiopost_url = d['audiopost_url']
						audiopost_date = d['audiopost_date']
						#actual_link = URI.parse(url_value)
						puts "created audiopost with name: #{audiopost_name} in show: #{show_name} with date: #{audiopost_date}"
						audiopost = show.audioposts.create(:title=>audiopost_name, :cast_remote_url=>audiopost_url, :user_id=>user.id, :audio_date=>audiopost_date)
					end
				end
			else
				# If any of the station, show or audiopost already exist
				# This is to be left out for now
				# We may want to find a way to merge them
				# But we will worry them later
			end
		end
		# user_email = args[:user_email]
		# station_name = args[:station_name]
		# show_name = args[:show_name]
		# audiopost_name = args[:audiopost_name]
		# audiopost_url = args[:audiopost_url]
		# audiopost_date = args[:audiopost_date]

	end
end
