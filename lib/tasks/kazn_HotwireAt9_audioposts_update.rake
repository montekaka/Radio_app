# encoding: UTF-8
desc "Update Today Topic Shows Podcast Archive"
task :kazn_HotwireAt9_audioposts_update => :environment do
	require 'updateAudiopost'
	require 'nokogiriDCWire'
	user = User.find_by_email("b@a.com")
	station = Station.find_by_name('AM1300')
	showa = station.shows.find_by_name('熱線phone九點')
	puts showa.name

	lastAudiopost = showa.audioposts.order("audio_date desc").limit(1)
	lastAudiopost.each do |i|
		puts 'latest audiopost date: ' + i.audio_date.to_s
		updateEpisode = updateAudiopost(showa.show_url, 'F',i.audio_date)
		if updateEpisode.length > 0
			updateEpisode.each do |e|
				puts "episode name: " + e.name
				puts "episode date: " + e.date.to_s
				showa.audioposts.create(:title => e.name, :audio=>e.url, :audio_date=>e.date, :short_note=>e.desc,:user_id=>user.id)
			end
		else
			puts "No new episode to update"
		end		
	end
end