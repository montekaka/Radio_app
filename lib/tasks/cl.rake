require 'open-uri'
require 'nokogiri'

	desc "Parse Craigslist"
	task :cl => :environment do

	car_name = "odyssey"

	#RSS file is a type of XML file
	doc = Nokogiri::XML(open("http://sandiego.craigslist.org/search/cto?query="+car_name+"&srchType=T&format=rss"))
	items = doc.xpath('//xmlns:title') #xml document has namespace

	items.each do |item| 
		puts item
	end
end
