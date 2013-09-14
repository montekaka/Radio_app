desc "Dropbox Setup User"
task :dropbox => :environment do

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
        station_roland = roland.stations.find_by_name("Roland's JustCast") 
        if station_roland == nil
            station_roland = Station.create!(:name=>"Roland's JustCast", :user_id=>roland.id)
            puts "Station Roland Chan created"
        end

        #create boxcast station if it is not created
        station_josh = josh.stations.find_by_name("Josh's JustCast") 
        if station_josh == nil
            station_josh = Station.create!(:name=>"Josh's JustCast", :user_id=>josh.id)
            puts "Station Josh Chen created"
        end
end

