require 'rubygems'
require 'nokogiri'
require 'open-uri'

class ShowCategory
	attr_accessor :name, :url, :hier, :id
end

class DummyShowInfo
	attr_accessor :hostDJ, :playDay, :playTime
end

class DummyEpisodeInfo
	attr_accessor :name, :date, :url
end

class ShowPage
	attr_accessor :name, :desc, :hostDJ, :url, :id, :categoryName, :categoryID, :playDay, :playTime
end

class EpisodePage
	attr_accessor :name, :desc, :date, :url, :id, :showID
end


def getEpisodeInfo(showURL)
	page = Nokogiri::HTML(open(showURL))
	showTitle = page.css('td#contentTd table td h3 strong.title').text.strip
	showDescription = page.css('td#contentTd p').text.strip
	episodeTable = page.css('td#contentTd table td a.hmenu')
	episodeTitle = []
	episodeURL = []

	episodeTable.each do |t|
		#episodeURL.push('http://www.moneyradio.org/'+t['href']) 
		episodeTitle.push(t.text.strip)
	end

	episodeLinks = page.css('td#contentTd table td a[target="_blank"]')
	episodeLinks.each do |i|
		episodeURL.push('http://www.moneyradio.org/'+i['href'])
	end
	return showDescription
end

puts getEpisodeInfo("http://www.moneyradio.org/showSubCategory.php?SCID=279")

