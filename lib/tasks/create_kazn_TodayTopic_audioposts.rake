# encoding: UTF-8
desc "Create Today Topic Shows Podcast Archive"
task :create_kazn_TodayTopic_audioposts => :environment do
	require 'updateAudiopost'
	require 'nokogiriTodayTopic'
	user = User.find_by_email("b@a.com")
	#check whether 1430 station exist?
	station = Station.find_by_name('AM1300')
	showa = station.shows.find_by_name('今日話題')
	puts showa.name
	audiopostMaster = getEpisodeInfo(showa.show_url, 'T')
	audiopostMaster.each do |e|
		puts "episode name: " + e.name
		puts "episode desc: " + e.desc
		puts "episode date: " + e.date.to_s
		puts "episode url: " + e.url
		showa.audioposts.create(:title => e.name, :audio=>e.url, :audio_date=>e.date, :short_note=>e.desc,:user_id=>user.id)
	end
end








