# encoding: UTF-8
desc "Create Money Radio from 1430 Shows Podcast Archive"
task :moneyradio_1430MR_audiopost_create => :environment do
	require 'updateAudiopost'	
	
	#check whether 1430 station exist?
	station = Station.find_by_name('節目重溫')
	showa = station.shows.find_by_name('理財天地')
	puts showa.name
	audiopostMaster = getEpisodeInfo(showa.show_url, 'T')
	audiopostMaster.each do |e|
		puts "episode name: " + e.name
		puts "episode desc: " + e.desc
		puts "episode date: " + e.date.to_s
		puts "episode url: " + e.url
		showa.audioposts.create(:title => e.name, :audio=>e.url, :audio_date=>e.date, :short_note=>'')
	end
end








