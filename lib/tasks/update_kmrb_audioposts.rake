task :update_kmrb_audioposts => :environment do
	require 'updateAudiopost.rb'
	station = Station.find_by_name('AM1430')

	station.shows.each do |show|
		puts 'Show ID: ' + show.id.to_s
		puts 'Show Name: ' + show.name
		#puts 'Show URL: ' + show.show_url
		lastAudiopost = show.audioposts.order("audio_date desc").limit(1)
		lastAudiopost.each do |i|
			puts 'latest audiopost date: ' + i.audio_date.to_s
			updateEpisode = updateAudiopost(show.show_url, 'T', i.audio_date)
			if updateEpisode.length > 0
				updateEpisode.each do |e|
					puts "episode name: " + e.name
					puts "episode date: " + e.date
					show.audioposts.create(:title => e.name, :audio=>e.url, :audio_date=>e.date, :short_note=>e.desc)
				end
			end
		end
	end	
end