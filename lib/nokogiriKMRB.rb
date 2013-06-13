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


def getShowCategory(homeURL)
	page = Nokogiri::HTML(open(homeURL))
	categoryName = []
	categoryURL = []
	categoryHier = []
	categoryMaster = []

	namePage = page.css('div.s02 .s02_t span')
	namePage.each do |i|
		categoryName.push(i.text.strip) 
	end
	urlPage = page.css('div.s02 .s02_t a')
	urlPage.each do |j|
		categoryURL.push(j['href'])
	end
	f = 0
	categoryName.each do |k|
		dummyCategory = ShowCategory.new
		dummyCategory.name = k
		dummyCategory.url = categoryURL[f]
		dummyCategory.hier = f+1

		categoryMaster.push(dummyCategory)
		f=f+1
	end
	return categoryMaster
end

def getShowDescription(showurl)
	dummyDesc = []
	page = Nokogiri::HTML(open(showurl))
	description = page.css('div.right01 dl ul.list6')[1].text.strip
	return description
end

# fuck = getShowDescription('http://www.am1300.com/index.php?m=content&c=index&a=lists&catid=37')
# puts fuck

def getShowName(showurl)
	dummyTitle = []
	page = Nokogiri::HTML(open(showurl))
	title = page.css('div.right01 dl ul.list6')[0].text.strip
	#this is for heroku production
	return title[3..title.length]
	#this is for local development
	#return title[6..title.length]
end

#puts getShowName('http://www.am1300.com/index.php?m=content&c=index&a=lists&catid=37')

def getShowDummyInfo(showURL)
	page = Nokogiri::HTML(open(showURL))
	namePage = page.css('table#type_1 tr:nth-child(2)')

	dummyInfo = DummyShowInfo.new
	dummyInfo.hostDJ = namePage.css('td:nth-child(2)').text.strip
	dummyInfo.playDay = namePage.css('td:nth-child(3)').text.strip
	dummyInfo.playTime = namePage.css('td:nth-child(4)').text.strip

	return dummyInfo
end

def getShowInfo(categoryURL)
	page = Nokogiri::HTML(open(categoryURL))

	dummy = []
	dummyName = []
	dummyHostDJ = []
	showDummyInfo = []
	showURL = []
	showDescription = []
	showName = []
	showMaster = []

	namePage = page.css('div.s02_c dl p[align="center"]')
	namePage.each do |n|
		dummyName.push(n.text.strip)
	end
	showPageURL = page.css('div.s02_c dl dt a')
	showPageURL.each do |s|
		showURL.push(s['href'])
	end

#use the showURL to lookup show description from the show page
	showURL.each do |s|
		showDescription.push(getShowDescription(s))
		showDummyInfo.push(getShowDummyInfo(s))
		showName.push(getShowName(s))
	end

	e = 0
	showURL.each do |o|
		dummyShow = ShowPage.new
		dummyShow.name = showName[e]		
		dummyShow.hostDJ = showDummyInfo[e].hostDJ
		dummyShow.playTime = showDummyInfo[e].playTime
		dummyShow.playDay = showDummyInfo[e].playDay
		dummyShow.url = o
		dummyShow.desc = showDescription[e]

		showMaster.push(dummyShow)
		e = e+1
	end
	return showMaster
end

def getShowPlayListTable(showURL)
	dummyEpisode = []

	page = Nokogiri::HTML(open(showURL))
	table = page.css('table#type_1 tr td a')
	table.each do |t|
		title = t.text.strip
		l = title.length

		episodeURL = t['href']
		#episodeDate = title[0..5]+'20'+title[6..7]
		episodeDate = title[3..5]+title[0..2]+'20'+title[6..7]
		episodeName = title[8..l]

		episode = DummyEpisodeInfo.new
		episode.name = episodeName
		episode.date = episodeDate
		episode.url = episodeURL

		dummyEpisode.push(episode)

	end
	return dummyEpisode
end

#fy = getShowPlayListTable('http://www.am1430.net/index.php?m=content&c=index&a=lists&catid=32&page=2')
#fy.each do |f|
#	puts f.name
#	puts f.date
#	puts f.url
#end

def getShowPlayList(showURL, firstTime)
	# if this is the first time we run
	# then we will run thought all
	# else we will only run the first page
	dummyFetchPage = [showURL]
	dummyEpisodes = []
	episodeInfo = []
	if firstTime == "T"
		page = Nokogiri::HTML(open(showURL))
		totalEpisode = page.css('a.a1:nth-child(1)').text.strip
		#for development
		#totalPageToFetch = (totalEpisode[0..totalEpisode.length-4].to_f/15).ceil
		#for heroku production
		totalPageToFetch = (totalEpisode[0..totalEpisode.length-1].to_f/15).ceil
		#puts totalPageToFetch.to_s
		$i  = 2
		while $i <= totalPageToFetch do
			dummyFetchPage.push(showURL+"&page="+$i.to_s)
			$i = $i + 1
		end
		#return dummyFetchPage
	end
	dummyFetchPage.each do |d|
		dummyEpisodes.push(getShowPlayListTable(d))
	end
	dummyEpisodes.each do |e|
		e.each do |f|
			episodeInfo.push(f)
		end
	end
	return episodeInfo
end

# fy = getShowPlayList('http://www.am1430.net/index.php?m=content&c=index&a=lists&catid=32','T')
# fy.each do |f|
# 	puts f.name.strip
# 	puts f.date.strip
# 	puts f.url
# end

def getEpisodeInfo(showURL, firstTime)
	dummyURL = Array.new	
	dummyName = []
	dummyDate = []
	dummyDesc = []

	episodeMaster = Array.new

	keyword1='mp3'
	keyword2='soundFile='	

	dummyEpisodes = getShowPlayList(showURL, firstTime)
	dummyEpisodeURL = []

	dummyEpisodes.each do |w|
		dummyName.push(w.name)
		dummyDate.push(w.date)
		dummyEpisodeURL.push(w.url)
	end
	dummyEpisodeURL.each do |u|		
		page = Nokogiri::HTML(open(u))
		#namePage = page.css('div.jmjs_main span.box_r2')
		audioPage = page.css('embed')
		
		shortDesc = page.css('div.right .right01 ul#breakNewsList').text.strip
				
		audioURL = Array.new
		audioPage.each do |i|
			a = i['src']			
			dummyLength = a.rindex(keyword1)
			shorterDummyLink =  a[0..dummyLength+keyword1.length-1]

			dummy2 = shorterDummyLink.rindex(keyword2)
			dummy3 = shorterDummyLink[(dummy2+keyword2.length)..(shorterDummyLink.length)]
			audioURL.push(dummy3)
		end
		dummyURL.push(audioURL)
		dummyDesc.push(shortDesc)
	end

	f = 0
	dummyURL.each do |j|
		k = 0
		j.each do |p|
			episode = EpisodePage.new
			if j.length > 1
				episode.name = dummyName[f].to_s.strip + " (" + (k+1).to_s + ")"
			else
				episode.name = dummyName[f].to_s.strip
			end
			episode.desc = dummyDesc[f].to_s.strip
			episode.date = dummyDate[f]
			episode.url = p
			k = k + 1
			episodeMaster.push(episode)
		end
		f = f + 1	
	end

	return episodeMaster
end

#category = getShowCategory('http://www.am1430.net/index.php?m=content&c=index&a=lists&catid=15')

# category.each do |c|
# 	puts "category name: " + c.name
# 	puts "category url: "  + c.url
# end


# show = getShowInfo('http://www.am1430.net/index.php?m=content&c=index&a=lists&catid=17')

# show.each do |s|
# 	puts "show name: " + s.name
# 	puts "show host: " + s.hostDJ
# 	puts "show desc: " + s.desc
# 	puts "show Play Day: " + s.playDay
# 	puts "show Play Time: " + s.playTime
# 	puts "show url: " + s.url
# end


#episode = getEpisodeInfo('http://www.am1430.net/index.php?m=content&c=index&a=lists&catid=33',"T")
# episode = getEpisodeInfo('http://www.am1430.net/index.php?m=content&c=index&a=lists&catid=59',"T")

# episode.each do |e|
# 	puts "episode name: " + e.name.to_s
# 	puts "episode desc: " + e.desc.to_s
# 	puts "episode date: " + e.date.to_s
# 	puts "episode url: " + e.url
# end

class PodcastCategory
	attr_accessor :name, :url, :showArray
end

class PodcastShow
	attr_accessor :name, :desc, :hostDJ, :url, :id, :categoryID, :categoryName, :playDay, :playTime, :episodeArray
end

def podcastShowInfo(homeHTML, firstTime)
	podcastShowArray = []
	allCategory = getShowCategory(homeHTML)
	allCategory.each do |c|
		#dummyCategoryName = c.name
		dummyShowArray = []
		dummyshow = getShowInfo(c.url)
		dummyshow.each do |s|			
			dummy_show = PodcastShow.new
			dummy_show.name = s.name
			dummy_show.desc = s.desc
			dummy_show.hostDJ = s.hostDJ
			dummy_show.url = s.url
			dummy_show.playDay = s.playDay
			dummy_show.playTime = s.playTime
			dummy_show.episodeArray = getEpisodeInfo(s.url,firstTime)
			#dummy_show.categoryName = dummyCategoryName
			dummyShowArray.push(dummy_show)
		end	
		dummy_PodcastCategory = PodcastCategory.new
		dummy_PodcastCategory.name = c.name
		dummy_PodcastCategory.url = c.url
		dummy_PodcastCategory.showArray = dummyShowArray
		podcastShowArray.push(dummy_PodcastCategory)
	end
	return podcastShowArray
end	

def getEpisodes(dataDummy, categoryName, showName)
	categoryName_index = 0
	showName_index = 0
	dataDummy.each do |f|
		if f.name != categoryName
			categoryName_index = categoryName_index + 1
		else
			break
		end
	end
	dataDummy[categoryName_index].showArray.each do |i|
		if i.name !=showName
			showName_index = showName_index + 1
		else
			break
		end
	end
	return dataDummy[categoryName_index].showArray[showName_index]
end
