desc "Dropbox Setup User"
task :dropbox => :environment do

        User.destroy_all
        Station.destroy_all
        Show.destroy_all
        Audiopost.destroy_all

       roland = User.find_by_email("b@b.com")
        if roland == nil
            roland = User.create!(:name=>"Roland Chan", :password=>"dropbox", :email=>"b@b.com", :token=>"w5gTdMYthqAAAAAAAAAAAUjYJ7489pbgtAGUxN_BSdG3QzOkL5S5Xm7v7d91HGFy")
            puts "User Roland Chan created"
        end

        josh = User.find_by_email("c@c.com")
        if josh == nil
            josh = User.create!(:name=>"Josh Chen", :password=>"dropbox", :email=>"c@c.com", :token=>"e0N242rOgW4AAAAAAAAAAWFQJ8kNlomQH5oZj7Sb5RkrKA8CNEFKCnTT9cup5_SQ")
	        puts "User Josh Chen created"
        end

        #create boxcast station if it is not created
        station_name = roland.name + "'s JustCast"
        station_roland = roland.stations.find_by_name(station_name) 
        if station_roland == nil
            station_roland = Station.create!(:name=>station_name, :user_id=>roland.id)
            puts "Station Roland Chan created"
        end

        #create boxcast station if it is not created
        station_name = josh.name + "'s JustCast"
        station_josh = josh.stations.find_by_name(station_name) 
        if station_josh == nil
            station_josh = Station.create!(:name=>station_name, :user_id=>josh.id)
            puts "Station Josh Chen created"
        end

        User.all.each do |user|
            puts "working on user: #{user.name}"
        	user.sync_dropbox()
        end

end

