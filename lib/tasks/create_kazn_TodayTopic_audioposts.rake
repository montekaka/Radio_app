# encoding: UTF-8
desc "Create Today Topic Shows Podcast Archive"
task :create_kazn_TodayTopic_audioposts => :environment do
	require 'updateAudiopost'
	require 'nokogiriTodayTopic'
	
	#check whether 1430 station exist?
  station = Station.find_by_name('AM1300')
  # if station == nil
  #   station = Station.create(:name=>"am1300")
  #   puts "there is no am1300 station, create a new one"
  # end  
  
  #show = Show.find_by_name('今日話題')
  #create the show if there is no 理財天地
  # if show == nil
  #    show = station.shows.create(:name=>"今日話題", 
  #                                :djname=>"中迅、高寧", 
  #                                :show_url=>"http://www.am1300.com/index.php?m=content&c=index&a=lists&catid=37",
  #                                :description=>"一個節目，兩個男人，三十多分鐘的講話時間，四面八方的資訊，五花八門的話題，六韜三略的分析，七十二行的聽衆，八鬥之才的奉獻，九牛之力的投入，十餘春秋的默契... ")
  #    #show will contain station info
  #    puts "there is no 今日話題, create a new one..."
  # end

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








