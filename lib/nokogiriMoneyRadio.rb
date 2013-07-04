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


def getHalfMinuteEpisodeInfo(showURL,theYear,defaultDate)
	page = Nokogiri::HTML(open(showURL))
	showTitle = page.css('td#contentTd table td h3 strong.title').text.strip
	showDescription = page.css('td#contentTd p').text.strip
	episodeTable = page.css('td#contentTd table td a.hmenu')
	episodeTitle = []
	episodeURL = []
	episodeDate = []
	episodeMaster = []
		
	episodeTable.each do |t|
		#episodeURL.push('http://www.moneyradio.org/'+t['href'])
		titleText = t.text.strip
		#episodeDate.push(titleText.index(theYear))		
		if(titleText.index(theYear).nil?)
			episodeDate.push(Date.strptime(defaultDate, '%m/%d/%Y'))
			episodeTitle.push(t.text.strip)
			#use this print out to debug
			#puts t.text.strip
		else
			if titleText.index('1011/2007') # this is special case in 2007
				episodeDate.push(Date.strptime(defaultDate, '%m/%d/%Y'))
				episodeTitle.push(t.text.strip)				
			else
				episodeDate.push(Date.strptime(titleText[0..(titleText.index(theYear)+theYear.length-1)], '%m/%d/%Y'))
				episodeTitle.push(titleText[(titleText.index(theYear)+theYear.length)..titleText.length]).to_s.strip
			end
			#use this print out to debug
			#puts t.text.strip
		end		
	end

	if(theYear=='2009')
		# get FIRST index of element searched
		titleRemoveIndex = episodeTitle.index('零九年9月16日(第一節')
		episodeTitle.delete_at(titleRemoveIndex)
		episodeDate.delete_at(titleRemoveIndex)
	end

	episodeLinks = page.css('td#contentTd table td a[target="_blank"]')	
	puts episodeLinks.length.to_s
	episodeLinks.each do |i|
		episodeURL.push('http://www.moneyradio.org/'+i['href'])
	end

	puts "Date: "+ episodeDate.length.to_s + ' Title: '+episodeTitle.length.to_s + ' url: '+episodeURL.length.to_s
	
	f = 0
	episodeURL.each do |j|
		episode = EpisodePage.new
		episode.name = episodeTitle[f]
		episode.date = episodeDate[f]
		episode.url = j
		f = f + 1

		episodeMaster.push(episode)
	end

	return episodeMaster
end

def getHalfMinuteArticle(showURL,theYear,defaultDate)
	page = Nokogiri::HTML(open(showURL))
	showTitle = page.css('td#contentTd table td h3 strong.title').text.strip
	showDescription = page.css('td#contentTd p').text.strip
	episodeTable = page.css('td#contentTd table td a.hmenu')
	episodeTitle = []
	episodeURL = []
	episodeDate = []
	episodeMaster = []
	episodeDesc = []
		
	episodeTable.each do |t|
		episodeURL.push('http://www.moneyradio.org/'+t['href'])
		titleText = t.text.strip
		#episodeDate.push(titleText.index(theYear))		
		if(titleText.index(theYear).nil?)
			episodeDate.push(Date.strptime(defaultDate, '%m/%d/%Y'))
			episodeTitle.push(t.text.strip)
			#use this print out to debug
			#puts t.text.strip
		else
			if titleText.index('1011/2007') # this is special case in 2007
				episodeDate.push(Date.strptime(defaultDate, '%m/%d/%Y'))
				episodeTitle.push(t.text.strip)				
			else
				episodeDate.push(Date.strptime(titleText[0..(titleText.index(theYear)+theYear.length-1)], '%m/%d/%Y'))
				episodeTitle.push(titleText[(titleText.index(theYear)+theYear.length)..titleText.length]).to_s.strip
			end
			#use this print out to debug
			#puts t.text.strip
		end
	end
	f = 0
	episodeURL.each do |c|
		articlePage = Nokogiri::HTML(open(c))
		content = articlePage.css('td#contentTd p').text.strip
		#puts content
		episodeDesc.push(content)
		puts f.to_s
		sleep(5)
		f = f+1
	end
	puts "title: "+episodeTitle.length.to_s + "content: "+episodeDesc.length.to_s
end

getHalfMinuteArticle('http://www.moneyradio.org/showSubCategory.php?SCID=1877','2004','01/01/2001')

