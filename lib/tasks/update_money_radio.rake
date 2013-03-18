desc "Update Money Radio Episodes"
task :update_money_radio => :environment do
  require 'nokogiri'
  require 'open-uri'
  
  show = Show.find_by_name('理財天地')
  #create the show if there is no 理財天地
  if show == nil
     show = Show.create(:name=>"理財天地", :djname=>"林修榮 / Inez")
     puts "there is no 理財天地, create a new one..."
  end

# delete all existing post  
show.audioposts.each do |audiopost|
  audiopost.destroy
end  
puts "delete all existing audioposts"
  
class EpisodePage
	attr_accessor :name, :desc, :date, :url, :id, :showID
end
  
	dummyURL = []
	dummyName = []
	dummyDate = []
	episodeMaster = []

	keyword1='mp3'
	keyword2='soundFile='
     showURL = 'http://www.am1430.net/index.php?m=content&c=index&a=show&catid=17&id=19'

	page = Nokogiri::HTML(open(showURL))
	namePage = page.css('div.jmjs_main span.box_r2')
	audioPage = page.css('embed')
	#audiopost_link = audiopost_link[0]['src']
	namePage.each do |p|
		k = p.text.strip
		l = k.length
		dummyDate.push(k[3..5]+k[0..2]+'20'+k[6..7])
		dummyName.push(k[8..l].strip)
	end

	audioPage.each do |i|
		a = i['src']
		dummyLength = a.rindex(keyword1)
		shorterDummyLink =  a[0..dummyLength+keyword1.length-1]

		dummy2 = shorterDummyLink.rindex(keyword2)
		dummy3 = shorterDummyLink[(dummy2+keyword2.length)..(shorterDummyLink.length)]
		dummyURL.push(dummy3)
	end

	f = 0
	dummyURL.each do |j|
		episode = EpisodePage.new
		episode.name = dummyName[f]
		episode.date = dummyDate[f]
		episode.url = j
		f = f + 1

		episodeMaster.push(episode)
	end

 episodeMaster.each do |e|
	puts "episode name: " + e.name
	puts "episode date: " + e.date
	puts "episode url: " + e.url
     # loop through the array and add each record
     show.audioposts.create(:title =>e.name, :audio =>e.url, :audio_date =>e.date)
     puts "record added"
end
  
end