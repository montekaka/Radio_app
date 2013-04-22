desc "Create KMRB"
task :create_kmrb_shows => :environment do
  require 'updateAudiopost.rb'
  
  #check whether 1430 station exist?
  station = Station.find_by_name('AM1430')
  if station == nil
    station = Station.create(:name=>"AM1430")
    puts "there is no am1430 station, create a new one"
    showMaster = updateShowInfo('http://www.am1430.net/index.php?m=content&c=index&a=lists&catid=15')
  end  
  #we should delete all the shows associate to am1430  
  showMaster.each do |s|
    puts "show name: " + s.name
    puts "show category: " + s.categoryName
    puts "show url: " + s.url
    #Show.create(:name=>s.name, :djname=>s.hostDJ, :description=>s.desc, :category=>s.categoryName, :show_url=>s.url)
    station.shows.create(:name=>s.name, :djname=>s.hostDJ, :description=>s.desc, :category=>s.categoryName, :show_url=>s.url)
  end
  
end