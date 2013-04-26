# encoding: UTF-8
desc "Create Today Topic Shows Podcast Archive"
task :kazn_DCWire_audioposts_create => :environment do
	require 'updateAudiopost'
	require 'nokogiriDCWire'
	station = Station.find_by_name('AM1300')
	showa = station.shows.find_by_name('華府熱線')
	puts showa.name
	audiopostMaster = getEpisodeInfo(showa.show_url, 'T')
	audiopostMaster.each do |e|
		puts "episode name: " + e.name
		puts "episode desc: " + e.desc
		puts "episode date: " + e.date.to_s
		puts "episode url: " + e.url
		#showa.audioposts.create(:title => e.name, :audio=>e.url, :audio_date=>e.date, :short_note=>e.desc)
	end
	episode = getEpisodeInfo('http://www.am1300.com/index.php?m=content&c=index&a=lists&catid=41',"T")

	episode.each do |e|
		puts "episode name: " + e.name
		puts "episode desc: " + e.desc
		puts "episode date: " + e.date.to_s
		puts "episode url: " + e.url
	end	
end

