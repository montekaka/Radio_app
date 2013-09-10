desc "Update userID to Station Show and Audioposts associate with KAZN and KMRB"
task :update_UserID_to_KAZN_KMRB => :environment do
	user = User.find_by_email("b@a.com")
	if user == nil
		user = User.create!(:name=>"Josh",:password=>"aaaaaa", :email=>"b@a.com")
	end

	#Update am1300 station
	station = Station.find_by_name("AM1300")
	station.user_id = user.id
	station.save!
	puts "Save "+station.name+" UserID to " + station.user_id.to_s

	station.shows.each do |s|
		#update each show within the station
		s.user_id = user.id
		s.save!
		puts "Save " + s.name + " UserID to " + s.user_id.to_s

		s.audioposts.each do |a|
			#update each audiopost within the show
			a.user_id = user.id
			a.save!
			puts "Save " + a.title + " UserID to " + a.user_id.to_s
		end
	end

	#Update am1430 station
	station = Station.find_by_name("AM1430")
	station.user_id = user.id
	station.save!
	puts "Save "+station.name+" UserID to " + station.user_id.to_s

	station.shows.each do |s|
		#update each show within the station
		s.user_id = user.id
		s.save!
		puts "Save " + s.name + " UserID to " + s.user_id.to_s

		s.audioposts.each do |a|
			#update each audiopost within the show
			a.user_id = user.id
			a.save!
			puts "Save " + a.title + " UserID to " + a.user_id.to_s
		end
	end	
end
