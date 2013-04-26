require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'nokogiriKMRB'
require 'date'

def getShowPlayListTable(showURL)
	dummyEpisode = []

	page = Nokogiri::HTML(open(showURL))
	table = page.css('table#type_1 tr')

	dummyEpisodeTitle = []
	dummyEpisodeURL = []
	dummyEpisodeDate = []
	dummyYear = []
	 table.each do |t|
	 	dummyURL = t.css('td:nth-child(1) a')
		dummyURL.each do |u|
			dummyEpisodeURL.push(u['href'].strip)
			dummyEpisodeTitle.push(u.text.strip)
			dummyYear = '20'+(u.text.strip[(u.text.strip.length-2)..(u.text.strip.length-1)])
			dummyDate = u.text.strip[0..(u.text.strip.length-3)]
			if(Date.strptime(dummyDate+dummyYear, '%m-%d-%Y')<Date.strptime('01-01-2000', '%m-%d-%Y'))
				dummyEpisodeDate.push(Date.strptime('01-01-2000', '%m-%d-%Y'))
			else				
				dummyEpisodeDate.push(Date.strptime(dummyDate+dummyYear, '%m-%d-%Y'))
			end
		end
	end
	i = 0
	dummyEpisodeTitle.each do |a|
		episode = DummyEpisodeInfo.new
		episode.name = dummyEpisodeTitle[i]
		episode.date = dummyEpisodeDate[i]
		episode.url = dummyEpisodeURL[i]
		dummyEpisode.push(episode)
		i = i + 1
	end
	return dummyEpisode
end


# fy = getShowPlayListTable('http://www.am1300.com/index.php?m=content&c=index&a=lists&catid=41&page=12')
# fy.each do |f|
# 	puts f.name
# 	puts f.date
# 	puts f.url
# end

def updateAudiopost(showHTML, firstTime, dbLastDay)
    audiopostUpdateArray = []
    fetchAudiopost = getEpisodeInfo(showHTML, firstTime)
    fetchAudiopost.each do |i|
    	#puts Date.strptime(i.date[0..1]+'-'+i.date[3..4]+'-'+i.date[6..9], '%d-%m-%Y')
    	#puts i.date
        if i.date > dbLastDay 
        #we need to turn the i.date into datevalue
            audiopostUpdateArray.push(i)            
        end
    end
    return audiopostUpdateArray
end

# latestDateInDB = Date.parse('2013-04-13') #March 20 2013

# episode = updateAudiopost('http://www.am1300.com/index.php?m=content&c=index&a=lists&catid=41', 'F', latestDateInDB)

# episode.each do |e|
# 	puts "episode name: " + e.name
# 	puts "episode desc: " + e.desc
# 	puts "episode date: " + e.date.to_s
# 	puts "episode url: " + e.url
# end
