require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'nokogiriKMRB'

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
			ddate=d[0..2]+d[3..5]+'20'+d[6..7]
			if ddate.to_f > 0
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

# fy = getShowPlayListTable('http://www.am1300.com/index.php?m=content&c=index&a=lists&catid=37&page=4')
# fy.each do |f|
# 	puts f.name
# 	puts f.date
# 	puts f.url
# end