# encoding: UTF-8
desc "Finance in Half Minute Podcast Archive"
task :moneyradio_financeInHalfMin => :environment do
	require 'nokogiriMoneyRadio'
	station = Station.find_by_name('節目重溫')
	showa = station.shows.find_by_name('理財分半鐘')
	puts showa.name

	halfMinuteYears = ['2004','2005','2006','2007','2008']
	halfMinuteURLs = ['http://www.moneyradio.org/showSubCategory.php?SCID=279', 
		'http://www.moneyradio.org/showSubCategory.php?SCID=278',
		'http://www.moneyradio.org/showSubCategory.php?SCID=277',
		'http://www.moneyradio.org/showSubCategory.php?SCID=276',
		'http://www.moneyradio.org/showSubCategory.php?SCID=5001']

	k = 0
	halfMinuteArray = []
	halfMinuteYears.each do |h|	
		demoURL = halfMinuteURLs[k]
		demo = getHalfMinuteEpisodeInfo(demoURL,h,'01/1/2001')
		k = k + 1
		demo.each do |d|
			episode = EpisodePage.new
			episode.name = d.name
			episode.date = d.date
			episode.url = d.url
			halfMinuteArray.push(episode)
		end	
	end

	# demo = getHalfMinuteEpisodeInfo("http://www.moneyradio.org/showSubCategory.php?SCID=276",'2007','01/1/2001')

	halfMinuteArray.each do |d|
		puts "episode Title: "+d.name
		puts "episode Date: "+d.date.to_s
		puts "episode URL: "+d.url.to_s
		showa.audioposts.create(:title => d.name, :audio=>d.url, :audio_date=>d.date, :short_note=>d.desc)
	end	
end

desc "Weekly Q&A Podcast Archive"
task :moneyradio_WeeklyQA => :environment do
	require 'nokogiriMoneyRadio'
	station = Station.find_by_name('節目重溫')
	showa = station.shows.find_by_name('每周問答節目')
	puts showa.name

	halfMinuteYears = ['2004a','2005a','2006a','2007a','2008a','2009a','2010a','2011a']
	halfMinuteURLs = ['http://www.moneyradio.org/showSubCategory.php?SCID=283', 
		'http://www.moneyradio.org/showSubCategory.php?SCID=282',
		'http://www.moneyradio.org/showSubCategory.php?SCID=281',
		'http://www.moneyradio.org/showSubCategory.php?SCID=280',
		'http://www.moneyradio.org/showSubCategory.php?SCID=5002',
		'http://www.moneyradio.org/showSubCategory.php?SCID=6016',
		'http://www.moneyradio.org/showSubCategory.php?SCID=6424',
		'http://www.moneyradio.org/showSubCategory.php?SCID=6742'
	]
	# halfMinuteYears = ['2010a']
	# halfMinuteURLs = [
	# 	'http://www.moneyradio.org/showSubCategory.php?SCID=6424'
	# ]	

	k = 0
	halfMinuteArray = []
	halfMinuteYears.each do |h|	
		demoURL = halfMinuteURLs[k]
		demo = getHalfMinuteEpisodeInfo(demoURL,h,'01/1/2001')
		k = k + 1
		demo.each do |d|
			episode = EpisodePage.new
			episode.name = d.name
			episode.date = d.date
			episode.url = d.url
			halfMinuteArray.push(episode)
		end	
	end

	# demo = getHalfMinuteEpisodeInfo("http://www.moneyradio.org/showSubCategory.php?SCID=276",'2007','01/1/2001')

	halfMinuteArray.each do |d|
		puts "episode Title: "+d.name
		puts "episode Date: "+d.date.to_s
		puts "episode URL: "+d.url.to_s
		showa.audioposts.create(:title => d.name, :audio=>d.url, :audio_date=>d.date, :short_note=>d.desc)
	end	
end

desc "Finance in Half Minute Article Archive"
task :moneyradio_financeInHalfMinArticle => :environment do
	require 'nokogiriMoneyRadio'
	station = Station.find_by_name('理財文章')
	showa = station.shows.find_by_name('理財分半鐘')
	puts showa.name

	# halfMinuteYears = ['2004','2005','2006','2007','2008']
	# halfMinuteURLs = ['http://www.moneyradio.org/showSubCategory.php?SCID=1877', 
	# 	'http://www.moneyradio.org/showSubCategory.php?SCID=2134',
	# 	'http://www.moneyradio.org/showSubCategory.php?SCID=2394',
	# 	'http://www.moneyradio.org/showSubCategory.php?SCID=2648',
	# 	'http://www.moneyradio.org/showSubCategory.php?SCID=4996'
	# ]
	halfMinuteYears = ['2004']
	halfMinuteURLs = ['http://www.moneyradio.org/showSubCategory.php?SCID=1877']

	k = 0
	halfMinuteArray = []
	halfMinuteYears.each do |h|	
		demoURL = halfMinuteURLs[k]
		demo = getHalfMinuteArticle(demoURL,h,'01/1/2001')
		k = k + 1
		demo.each do |d|
			episode = EpisodePage.new
			episode.name = d.name
			episode.date = d.date
			episode.desc = d.desc
			#episode.url = d.url
			halfMinuteArray.push(episode)
		end	
	end

	# demo = getHalfMinuteEpisodeInfo("http://www.moneyradio.org/showSubCategory.php?SCID=276",'2007','01/1/2001')

	audioStation = Station.find_by_name('節目重溫')
	audioshowa = audioStation.shows.find_by_name('理財分半鐘')	

	halfMinuteArray.each do |d|
		puts "episode Title: "+d.name
		puts "episode Date: "+d.date.to_s
		puts "episode Desc: "+d.desc.to_s
		#puts "episode URL: "+d.url.to_s
		showa.audioposts.create(:title => d.name, :audio_date=>d.date, :short_note=>d.desc)
		puts "Success"

		audioarchive = audioshowa.audioposts.find_by_title(d.name)
		
		if audioarchive
			puts "found the show name match with " + audioarchive.title
			audioarchive.short_note=d.desc
		end
	end
end