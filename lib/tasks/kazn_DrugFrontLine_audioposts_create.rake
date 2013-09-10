# encoding: UTF-8
desc "Create Today Topic Shows Podcast Archive"
task :kazn_DrugFrontLine_audioposts_create => :environment do
	require 'updateAudiopost'
	require 'nokogiriDCWire'
	user = User.find_by_email("b@a.com")
	station = Station.find_by_name('AM1300')
	showa = station.shows.find_by_name('醫藥最前線')
	puts showa.name
	# fy = getShowPlayList(showa.show_url, 'T')
	# fy.each do |f|
	# 	puts f.name.strip
	# 	puts f.date.to_s
	# 	puts f.url
	# end	
	audiopostMaster = getEpisodeInfo(showa.show_url, 'T')
	audiopostMaster.each do |e|
		puts "episode name: " + e.name
		puts "episode desc: " + e.desc
		puts "episode date: " + e.date.to_s
		puts "episode url: " + e.url
		showa.audioposts.create(:title => e.name, :audio=>e.url, :audio_date=>e.date, :short_note=>e.desc,:user_id=>user.id)
	end
end

