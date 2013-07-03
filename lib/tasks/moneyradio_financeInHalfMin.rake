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

	halfMinuteYears = ['2004','2005','2006','2007','2008','2009','2010','2011']
	halfMinuteURLs = ['http://www.moneyradio.org/showSubCategory.php?SCID=283', 
		'http://www.moneyradio.org/showSubCategory.php?SCID=282',
		'http://www.moneyradio.org/showSubCategory.php?SCID=281',
		'http://www.moneyradio.org/showSubCategory.php?SCID=280',
		'http://www.moneyradio.org/showSubCategory.php?SCID=5002',
		'http://www.moneyradio.org/showSubCategory.php?SCID=6016',
		'http://www.moneyradio.org/showSubCategory.php?SCID=6424',
		'http://www.moneyradio.org/showSubCategory.php?SCID=6742'
	]
	# halfMinuteYears = ['2009']
	# halfMinuteURLs = [
	# 	'http://www.moneyradio.org/showSubCategory.php?SCID=6016'
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
		#showa.audioposts.create(:title => d.name, :audio=>d.url, :audio_date=>d.date, :short_note=>d.desc)
	end	
end