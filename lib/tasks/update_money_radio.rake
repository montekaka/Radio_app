desc "Update Money Radio Episodes"
task :update_money_radio => :environment do
  #require 'nokogiri'
  #require 'open-uri'
  #require 'nokogiriKMRB.rb'
  require 'updateAudiopost.rb'
  
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

  # fetch the entire am1430 archive file
  #demo = podcastShowInfo('http://www.am1430.net/index.php?m=content&c=index&a=lists&catid=15', "T")
  #episodeMaster = getEpisodes(demo, '咨訊服務/生活類','理財天地').episodeArray

  # only for money radio archive
  moneyRadioHTML = 'http://www.am1430.net/index.php?m=content&c=index&a=lists&catid=46'
  latestDateInDB = Date.parse('2013-01-01') #March 14 2013
  episodeMaster = updateAudiopost('http://www.am1430.net/index.php?m=content&c=index&a=lists&catid=46', 'F', latestDateInDB)

 episodeMaster.each do |e|
	puts "episode name: " + e.name
	puts "episode date: " + e.date
	puts "episode url: " + e.url
     # loop through the array and add each record
     show.audioposts.create(:title =>e.name, :audio =>e.url, :audio_date =>e.date)
     puts "record added"
 end
  
end