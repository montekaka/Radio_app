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
	#remove the first row because its nil
	table= table[1..table.length]

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
		if dummyDate != "週一~週五"
			ddate=Date.strptime(dummyDate[0..2]+dummyDate[3..5]+'20'+dummyDate[6..7], '%m/%d/%Y')
			episodeDate = ddate
		else
			episodeDate = Date.strptime('01/01/2010','%m/%d/%Y')
		end
		dummyEpisodeDate.push(episodeDate)
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


# fy = getShowPlayListTable('http://www.am1300.com/index.php?m=content&c=index&a=lists&catid=37')
# fy.each do |f|
# 	puts f.name
# 	puts f.date
# 	puts f.url
# end

def updateAudiopost(showHTML, firstTime, dbLastDay)
    audiopostUpdateArray = []
    fetchAudiopost = getEpisodeInfo(showHTML, firstTime)
    fetchAudiopost.each do |i|    	
        if i.date > dbLastDay
            audiopostUpdateArray.push(i)            
        end
    end
    return audiopostUpdateArray
end

# latestDateInDB = Date.parse('2013-04-23') #March 20 2013

# episode = updateAudiopost('http://www.am1300.com/index.php?m=content&c=index&a=lists&catid=37', 'F', latestDateInDB)

# episode.each do |e|
# 	puts "episode name: " + e.name
# 	puts "episode desc: " + e.desc
# 	puts "episode date: " + e.date.to_s
# 	puts "episode url: " + e.url
# end