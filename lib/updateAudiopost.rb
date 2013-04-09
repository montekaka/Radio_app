require 'nokogiriKMRB'
require 'date'

def updateShowInfo(homeHTML)
    podcastShowArray = []
    allCategory = getShowCategory(homeHTML)
    allCategory.each do |c|
        dummyCategoryName = c.name
        dummyshow = getShowInfo(c.url)
        dummyshow.each do |s|           
            dummy_show = PodcastShow.new
            dummy_show.name = s.name
            dummy_show.desc = s.desc
            dummy_show.hostDJ = s.hostDJ
            dummy_show.url = s.url
            dummy_show.playDay = s.playDay
            dummy_show.playTime = s.playTime
            dummy_show.categoryName = dummyCategoryName
            podcastShowArray.push(dummy_show)            
        end 
    end
    return podcastShowArray
end 

# dummy = updateShowInfo('http://www.am1430.net/index.php?m=content&c=index&a=lists&catid=15')

# dummy.each do |d|
#     puts "show name: " +d.name
#     puts "show category: " +d.categoryName
#     puts "show DJ: " + d.hostDJ
#     puts "show DJ length: " + d.hostDJ.nil?.to_s
#     puts "show url: " +d.url
# end


def updateAudiopost(showHTML, firstTime, dbLastDay)
    audiopostUpdateArray = []
    fetchAudiopost = getEpisodeInfo(showHTML, firstTime)
    fetchAudiopost.each do |i|    	
        if Date.strptime(i.date[0..1]+'-'+i.date[3..4]+'-'+i.date[6..9], '%d-%m-%Y') > dbLastDay 
        #we need to turn the i.date into datevalue
            audiopostUpdateArray.push(i)            
        end
    end
    return audiopostUpdateArray
end

# latestDateInDB = Date.parse('2013-03-19') #March 20 2013

# episode = updateAudiopost('http://www.am1430.net/index.php?m=content&c=index&a=lists&catid=33', 'F', latestDateInDB)

# episode.each do |e|
# 	puts "episode name: " + e.name
# 	puts "episode desc: " + e.desc
# 	puts "episode date: " + e.date
# 	puts "episode url: " + e.url
# end
