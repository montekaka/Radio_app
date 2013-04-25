# encoding: UTF-8
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

	 table.each do |t|
	 	dummyURL = t.css('td:nth-child(1) a')
		dummyURL.each do |u|
			dummyEpisodeURL.push(u['href'].strip)
			dummyEpisodeTitle.push(u.text.strip)			
		end
		dummyDate = t.css('td:nth-child(3)').text.strip		
		dummyDate.each do |d|			
			#puts Date.strptime(ddate, '%m/%d/%Y')
			puts d
			if d != "週一~週五"
				ddate=d[0..2]+d[3..5]+'20'+d[6..7]
				episodeDate = ddate
			else
				episodeDate = '01/01/2010'				
			end
			dummyEpisodeDate.push(episodeDate)
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


# fy = getShowPlayListTable('http://www.am1300.com/index.php?m=content&c=index&a=lists&catid=37&page=6')
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
        if Date.strptime(i.date[3..4]+'-'+i.date[0..1]+'-'+i.date[6..9], '%d-%m-%Y') > dbLastDay 
        #we need to turn the i.date into datevalue
            audiopostUpdateArray.push(i)            
        end
    end
    return audiopostUpdateArray
end

# latestDateInDB = Date.parse('2013-04-13') #March 20 2013

# episode = updateAudiopost('http://www.am1300.com/index.php?m=content&c=index&a=lists&catid=37', 'F', latestDateInDB)

# episode.each do |e|
# 	puts "episode name: " + e.name
# 	puts "episode desc: " + e.desc
# 	puts "episode date: " + e.date
# 	puts "episode url: " + e.url
# end