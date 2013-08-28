require 'open-uri'
require 'nokogiri'

	desc "Parse RTHK"
	task :rthk => :environment do
	 
	doc = Nokogiri::HTML(open("http://podcast.rthk.hk/podcast/list_all.php?lang=en-US"))
	items = doc.css('.items a')

	items.each_with_index do |item, i|
	  if (i%2!=0) #only take odd index		
	  	podcast_link = 'http://podcast.rthk.hk/podcast/' + item['href']
	  	podcast_doc = Nokogiri::HTML(open(podcast_link))
	  	rss = podcast_doc.css('#btn-rss')[0]['href']
	  	puts rss
	  end
	end
end
