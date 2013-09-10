# encoding: UTF-8
desc "Update Money Radio from 1430 Shows Podcast Archive"
task :moneyradio_1430MR_audiopost_update => :environment do
	require 'updateAudiopost'
	user = User.find_by_email("b@a.com")
	station = Station.find_by_name('節目重溫')
	show = station.shows.find_by_name('理財天地')
	puts show.name

	lastAudiopost = show.audioposts.order("audio_date desc").limit(1)
	lastAudiopost.each do |i|
		puts 'latest audiopost date: ' + i.audio_date.to_s
		updateEpisode = updateAudiopost(show.show_url, 'T', i.audio_date)
		if updateEpisode.length > 0
			updateEpisode.each do |e|
				puts "episode name: " + e.name
				puts "episode date: " + e.date
				show.audioposts.create(:title => e.name, :audio=>e.url, :audio_date=>e.date, :short_note=>e.desc,:user_id=>user.id)
			end
		end
	end	
end