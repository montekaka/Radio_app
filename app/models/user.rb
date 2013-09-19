require 'dropbox_sdk'
require 'securerandom'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
	attr_accessible :email, :name, :token, :dropbox_id
	has_many :audioposts
	has_many :stations
	has_many :shows

def sync_dropbox()

        token = self.token
        puts "the self.token is #{token}"
        client = DropboxClient.new(token)

        if client == nil
            puts "error getting dropbox user"
            return
        end

        #client = get_dropbox_client
        #unless client
        #    redirect_to(:action => 'auth_start') and return
        #end

        #create boxcast station if it is not created
        station = self.stations.first
        if station == nil
            tation_name = self.name + " JustCast"
            station = Station.create!(:name=>station_name, :user_id=>self.id)
        end

        @urls = Array.new
        @cursor = self.cursor
        @delta = client.delta(self.cursor)
        # save the cursor to database
        self.cursor = @delta['cursor']
        self.save
        entries = @delta['entries']
        # loop for each entry
        entries.each do |entry|
            path = entry[0]
            metadata = entry[1]

            if metadata == nil
                # the file/folder is deleted
                # sample for a deleted delta
                #{"reset"=>false, 
                #"cursor"=>"AAFfMgSVnfaABJROaOE6WQdaOJh10XfRi2LVs-OH9gVp1hZA4_-Jqi4Vzb6hYWgfrOurc8jfHjnn0IYTR95C991LW3RvkmTw0PTk38Ac12ttqQ", 
                #"has_more"=>false, 
                #"entries"=>[["/newly added/林峯 - 如果時間來到.mp3", nil], ["/newly added", nil]]}

                #parse the path
                folder_names = Array.new
                path.split('/').collect do |folder|
                    folder_names << folder
                end
                
                if folder_names.size() == 2 
                    #it is a show folder
                    show = station.shows.find_by_name(folder_names.last)
                    if show != nil
                        puts "deleted a show with name #{folder_names.last}"
                        show.destroy()     
                    end
                elsif folder_names.size() == 3
                    #it is a audiopost
                    show_name = folder_names[1] 
                    show = station.shows.find_by_name(show_name)
                    if show == nil
                        puts "show #{show_name} already deleted"
                    else
                        filename_date = self.parse_podcast_name(path)    
                        if filename_date != nil
                            audiopost = show.audioposts.find_by_title(filename_date[:file_name])
                            if audiopost != nil 
                                audiopost.destroy()
                            end
                        end
                    end

                else
                    #ignore all other folder_name.size()
                end

            elsif metadata['is_dir'] == true
                # if it is a folder 
                folder_names = Array.new
                path.split('/').collect do |folder|
                    folder_names << folder
                end 
                # puts "the folder_names is #{folder_names}"
                # folder_names should have 2 level (/show_a) <-- this will create an array of ["", "show_a"], so size is 2
                if folder_names.size() == 2
                    show = station.shows.find_by_name(folder_names.last)
                    if show == nil
                        puts "created a show with name #{folder_names.last}"
                        show = station.shows.create!(:name=>folder_names.last, :djname=>nil, :description=>nil, :category=>"JustCast", :show_url=>nil, :user_id=>self.id) 
                    end
                else
                # ignore other folders for now
                end
            else
                # if it is a file
                file_names = Array.new
                path.split('/').collect do |filename|
                    file_names << filename
                end
                 # file_names should have 3 level (/show_a/espisode_1) <-- this will create an array of ["", "show_a","espisode_1"], so size is 3
                if file_names.size() == 3
                    show_name = file_names[1] 
                    show = station.shows.find_by_name(show_name)
                    if show == nil
                        puts "error, show not found"
                    end
                    filename_date = self.parse_podcast_name(path)

                    if filename_date != nil
                        if filename_date[:file_date] == nil
                            audio_date = metadata['modified']
                        else
                            audio_date = filename_date[:file_date]
                        end
                        audiopost = show.audioposts.find_by_title(filename_date[:file_name])
                        if audiopost != nil
                            audiopost.destroy #destroy the old one in case it is replacement file, always destroy old record
                        end
                    end
                    url = client.media(path)
                    puts "the filename is #{filename_date[:file_name]}"
                    puts "the file date is #{audio_date}"
                    audiopost = show.audioposts.create(:title=>filename_date[:file_name], :audio=>url['url'], :user_id=>self.id, :audio_date=>audio_date)
                    if audiopost.errors.size != 0
                        puts "error creating audiopost"
                        puts audiopost.errors.inspect
                    end

                end

            end

            puts "the path is #{path}"
            puts "the metadata is #{metadata}"

        end

        # @root_metadata = client.metadata('/')
        # #loop for each folder inside root(/Apps/justCast)
        # @root_metadata['contents'].each do |c|
        #     if c['is_dir'] == true

        #         path = c['path']
        #         folder_name = Array.new
        #         path.split('/').collect do |folder|
        #             folder_name << folder
        #         end    
        #         # if it is a folder, go into folder and get the content
        #         show = station.shows.find_by_name(folder_name.last)
        #         if show == nil
        #             show = station.shows.create!(:name=>folder_name.last, :djname=>nil, :description=>nil, :category=>"JustCast", :show_url=>nil, :user_id=>user.id) 
        #         end

        #         @folder_metadata = client.metadata(path)
        #         #loop for each item inside folder
        #         @folder_metadata['contents'].each do |file|
        #             if file['is_dir'] == false
        #                 #make sure it is a file instead of folder
        #                 file_path = file['path']
        #                 file_name = Array.new
        #                 file_path.split('/').collect do |item|
        #                     file_name << item
        #                 end

        #                 puts "the file path is #{file['path']}"
        #                 puts "the file name is #{file_name.last}"
        #                 puts "the date is #{file['modified']}"

        #                 audiopost = show.audioposts.find_by_title(file_name.last)
        #                 if audiopost == nil 
        #                     url = client.media(file_path)
        #                     @urls << url['url'] #add to urls array
        #                     audiopost = show.audioposts.create(:title=>file_name.last, :audio=>url['url'], :user_id=>user.id, :audio_date=>file['modified'])
        #                 end
        #             end
        #         end
        #     end
        # end


    end

    require 'date'
    def parse_podcast_name(path)
        # we only allow the second layer such as show/podcast.mp3
        allow_path = 1
        while path.index('/') != nil do
            i = path.index('/')+1
            path = path[i..path.length]
            allow_path = allow_path + 1
        end
        if allow_path == 3
            rev_path = path.reverse
            if rev_path.index('.').nil?
                i = 0
            else
                i = rev_path.index('.')+1
            end
            new_path = rev_path[i..rev_path.length]

            file_Name = new_path.reverse
            possible_Date = new_path[0..9].reverse

            month = possible_Date[0..1]
            day = possible_Date[3..4]
            year = possible_Date[6..9]

            possible_Date = year.to_s+'-'+month.to_s+'-'+day.to_s
            if Date._parse(possible_Date)[:year].nil? or Date._parse(possible_Date)[:mon].nil? or Date._parse(possible_Date)[:mday].nil?
                file_Date = nil
            else
                file_Date = Date.strptime(possible_Date, '%Y-%m-%d')
            end
            
            return { :file_name => file_Name, :file_date => file_Date }
        else
            return nil
        end
    end #end of def parse_podcast_name(path)

end
