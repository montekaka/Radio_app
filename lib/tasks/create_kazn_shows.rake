desc "Create KAZN"
task :create_kazn_shows => :environment do
  require 'updateAudiopost.rb'
  
  #check whether 1300 station exist?
  station = Station.find_by_name('AM1300')
  if station == nil
    station = Station.create(:name=>"AM1300")
    puts "there is no AM1300 station, create a new one"
  end    
  #we should delete all the shows associate to AM1300
  showMaster = updateShowInfo('http://www.am1300.com/index.php?m=content&c=index&a=lists&catid=29')
  showMaster.each do |s|
    puts "show name: " + s.name
    puts "show name length: "+s.name.length.to_s
    puts "show category: " + s.categoryName
    puts "show url: " + s.url
    #Show.create(:name=>s.name, :djname=>s.hostDJ, :description=>s.desc, :category=>s.categoryName, :show_url=>s.url)
    station.shows.create(:name=>s.name, :djname=>s.hostDJ, :description=>s.desc, :category=>s.categoryName, :show_url=>s.url)
  end
  
end