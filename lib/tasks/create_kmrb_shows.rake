desc "Create KMRB"
task :create_kmrb_shows => :environment do
  #require 'nokogiri'
  #require 'open-uri'
  #require 'nokogiriKMRB.rb'
  require 'updateAudiopost.rb'
  
  #we should delete all the shows associate to am1430
  showMaster = updateShowInfo('http://www.am1430.net/index.php?m=content&c=index&a=lists&catid=15')
  showMaster.each do |s|
    puts "show name: " + s.name
    puts "show category: " + s.categoryName
    puts "show url: " + s.url
    Show.create(:name=>s.name, :djname=>s.hostDJ, :description=>s.desc, :category=>s.categoryName, :show_url=>s.url)
  end
  
end