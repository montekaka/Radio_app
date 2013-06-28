require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'date'

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


def getEpisodeInfo(showURL,theYear,defaultDate)
	page = Nokogiri::HTML(open(showURL))
	showTitle = page.css('td#contentTd table td h3 strong.title').text.strip
	showDescription = page.css('td#contentTd p').text.strip
	episodeTable = page.css('td#contentTd table td a.hmenu')
	episodeTitle = []
	episodeURL = []
	episodeDate = []

	episodeTable.each do |t|
		#episodeURL.push('http://www.moneyradio.org/'+t['href'])
		titleText = t.text.strip
		#episodeDate.push(titleText.index(theYear))		
		if(titleText.index(theYear).nil?)
			episodeDate.push(Date.strptime(defaultDate, '%m/%d/%Y'))
			episodeTitle.push(t.text.strip)
		else
			episodeDate.push(Date.strptime(titleText[0..(titleText.index(theYear)+theYear.length-1)], '%m/%d/%Y'))
			#episodeDate.push(titleText[0..(titleText.index(theYear)+theYear.length-1)])
			episodeTitle.push(titleText[(titleText.index(theYear)+theYear.length)..titleText.length]).to_s.strip
		end		
	end

	episodeLinks = page.css('td#contentTd table td a[target="_blank"]')
	episodeLinks.each do |i|
		episodeURL.push('http://www.moneyradio.org/'+i['href'])
	end


	return episodeDate
end

puts getEpisodeInfo("http://www.moneyradio.org/showSubCategory.php?SCID=279",'2004','01/1/2001')


