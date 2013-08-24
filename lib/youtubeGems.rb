require 'rubygems'
require 'nokogiri'
require 'youtube_search'
require 'youtube-ripper'

# $i=2
# j = 0
# while $i < 15 do
# 	authorsAtgoogleYoutubes = YoutubeSearch.search('authors@google', 'author'=>'AtGoogleTalks', :page=>$i, :per_page=>50)
# 	authorsAtgoogleYoutubes.each do |authorsAtgoogleYoutube|
# 		#puts authorsAtgoogleYoutube['title']
# 		j = j + 1
# 	end	
# 	$i = $i + 1
# end
# puts j.to_s



youtube_id = YoutubeSearch.search('authors@google', 'author'=>'AtGoogleTalks').first['video_id']
youtube_url = "http://www.youtube.com/watch?v="+youtube_id
thumbnail = 'http://i.ytimg.com/vi/'+youtube_id+'/0.jpg'
postDate = YoutubeSearch.search('authors@google').first['published']
category = YoutubeSearch.search('authors@google').first['raw'].elements['category[@label]'].attributes['label']
title = YoutubeSearch.search('authors@google').first['title']

description = YoutubeSearch.search('authors@google').first['content']

#puts youtube_url

Youtube::Downloader(youtube_url)
