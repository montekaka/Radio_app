require 'open-uri'
require 'nokogiri'

desc "Create and load all am1400 show and episodes"
task :am1400 => :environment do
	 
	user = User.find_by_email("a@a.com")
	if user == nil
		user = User.create!(:name=>"Roland", :password=>"aaaaaa", :email=>"a@a.com")
	end

	#create am1400 station if it is not created
	station = Station.find_by_name('AM1400') 
	if station == nil
		station = Station.create!(:name=>"AM1400", :user_id=>user.id)
    	puts "there is no am1400 station, create a new one"
    end

    #create shows
    doc = Nokogiri::HTML(open("http://www.chineseradio.com/program.html"))
	items = doc.xpath('//td[(((count(preceding-sibling::*) + 1) = 2) and parent::*)]//*[contains(concat( " ", @class, " " ), concat( " ", "style9", " " ))]//a')
	items.each do |item|
		if item.text != ""
			show_name = item.text.strip
			show_url = "http://www.chineseradio.com/" + item['href']		
			show = Show.find_by_name(show_name)
			if show == nil
				show = station.shows.create!(:name=>show_name, :djname=>nil, :description=>nil, :category=>"AM1400", :show_url=>show_url, :user_id=>user.id) 
				puts "create show with name: #{show_name}"
			end

			#create audiopost	
			doc2 = Nokogiri::HTML(open(show_url))
			podcasts = doc2.css("table td .style6 a")
		  	podcasts.each do |podcast|
	  			podcast_name = podcast.text	
	  			podcast_url =  "http://www.chineseradio.com/" + podcast['href']
	  			podcast_date = Date.new(podcast.text[6..9].to_i,podcast.text[0..1].to_i,podcast.text[3..4].to_i)
	  			#podcast_date = podcast.text[3..4]+podcast.text[0..1]+podcast.text[6..9]
	  			audiopost = show.audioposts.find_by_title(podcast_name)
	  			if audiopost == nil
	  				audiopost = show.audioposts.create(:title=>podcast_name, :audio=>podcast_url, :user_id=>user.id, :audio_date=>podcast_date)
	  				puts "created audiopost with name: #{podcast_name} in show: #{show_name} with date: #{podcast_date}"
	  				#puts "the audio_post url is #{podcast_url}"
	  			end
	  		end
		end				
	end
end