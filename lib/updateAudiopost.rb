require 'nokogiriKMRB'
require 'date'

def


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
