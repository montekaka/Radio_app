desc "Create KMRB Shows Podcast Archive"
task :create_kazn_TodayTopic_audioposts => :environment do
	require 'updateAudiopost'
	require 'nokogiriTodayTopic'
	station = Station.find_by_name('AM1300')

	# station.shows.each do |show|
	# 	puts 'Show ID: ' + show.id.to_s
	# 	puts 'Show Name: ' + show.name
	# 	puts 'Show URL: ' + show.show_url
	# 	audiopostMaster = getEpisodeInfo(show.show_url, 'T')
	# 	audiopostMaster.each do |e|
	# 		puts "episode name: " + e.name
	# 		puts "episode desc: " + e.desc
	# 		puts "episode date: " + e.date
	# 		puts "episode url: " + e.url
	# 		show.audioposts.create(:title => e.name, :audio=>e.url, :audio_date=>e.date, :short_note=>e.desc)
	# 	end
	# end

	showa = station.shows.find_by_name('今日話題')
	puts showa.name
	audiopostMaster = getEpisodeInfo(showa.show_url, 'T')
	audiopostMaster.each do |e|
		puts "episode name: " + e.name
		puts "episode desc: " + e.desc
		puts "episode date: " + e.date
		puts "episode url: " + e.url
		showa.audioposts.create(:title => e.name, :audio=>e.url, :audio_date=>e.date, :short_note=>e.desc)
	end
end










