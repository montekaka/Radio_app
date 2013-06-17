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

