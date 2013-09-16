# ---------------------------------------------------------------------------------------
# A Rails 3 controller that:
# - Runs the through Dropbox's OAuth 2 flow, yielding a Dropbox API access token.
# - Makes a Dropbox API call to upload a file.
#
# To run:
# 1. You need a Rails 3 project (to create one, run: rails new <folder-name>)
# 2. Copy this file into <folder-name>/app/controllers/
# 3. Add the following lines to <folder-name>/config/routes.rb
#        get  "dropbox/main"
#        post "dropbox/upload"
#        get  "dropbox/auth_start"
#        get  "dropbox/auth_finish"
# 4. Run: rails server
# 5. Point your browser at: https://localhost:3000/dropbox/main
# example of delta and media call
#client.media(client.delta(prev_cursor)['entries'][0][1]['path'])['url']
require 'dropbox_sdk'
require 'securerandom'

APP_KEY = "xs74qq784d9t162"
APP_SECRET = "06jeldwww4n7kl1"

class DropboxController < ApplicationController

    def main
        client = get_dropbox_client
        unless client
            redirect_to(:action => 'auth_start') and return
        end
        
        dropbox_path_create = params[:dropbox_path]? params[:dropbox_path] : "example"
        #@station_show_name = 'ruby'
        account_info = client.account_info

        #create the show folder
        begin
            #Create a folder Dropbox with given name            
            resp = client.file_create_folder(dropbox_path_create)
            render :text => "Create successful.  File now at #{resp['path']}"
        rescue DropboxAuthError => e
            session.delete(:access_token)  # An auth error means the access token is probably bad
            logger.info "Dropbox auth error: #{e}"
            render :text => "Dropbox auth error"
        rescue DropboxError => e
            logger.info "Dropbox API error: #{e}"
            render :text => "Dropbox API error"
        end        

        # Show a file upload page
        # render :inline =>
        #   "#{account_info['email']} <br/><%= form_tag({:action => :upload}, :multipart => true) do %><%= file_field_tag 'file' %><%= submit_tag 'Upload' %><% end %>"

        # Show a folder create page
        # render :inline =>
        #    "#{account_info['email']} <br/><%= form_tag({:action => :create}, :multipart => true) do %><%= file_field_tag 'file' %><%= submit_tag 'Create' %><% end %>"

        # Show delta file
        # render :inline =>
        #        "#{account_info['email']} <br/> <%= form_tag({:action => :create}, :multipart => true) do %><%= file_field_tag 'file' %><%= submit_tag 'Create' %><% end %>"
        
        #render :inline =>
        #        "<%=params[:param_a] %> <br/> <%= form_tag({:action => :create}, :multipart => true) do %><%= file_field_tag 'file' %><%= submit_tag 'Create' %><% end %>"        
    end

    def reset

        #get the dropbox client, will redirect for auth if user has not login
        client = get_dropbox_client
        unless client
            redirect_to(:action => 'auth_start') and return
        end

        user = User.find_by_email("b@b.com")
        if user == nil
            user = User.create!(:name=>"Dropbox Testing", :password=>"dropbox", :email=>"b@b.com")
        end

        user.audioposts.destroy_all
        user.shows.destroy_all
        user.stations.destroy_all

        #create boxcast station if it is not created
        station = user.stations.find_by_name('JustCast') 
        if station == nil
            station = Station.create!(:name=>"JustCast", :user_id=>user.id)
        end

        @root_metadata = client.metadata('/')
        #loop for each folder inside root(/Apps/justCast)
        @root_metadata['contents'].each do |c|
            if c['is_dir'] == true

                path = c['path']
                folder_name = Array.new
                path.split('/').collect do |folder|
                    folder_name << folder
                end    
                # if it is a folder, go into folder and get the content
                show = station.shows.find_by_name(folder_name.last)
                if show == nil
                    show = station.shows.create!(:name=>folder_name.last, :djname=>nil, :description=>nil, :category=>"JustCast", :show_url=>nil, :user_id=>user.id) 
                end

                @folder_metadata = client.metadata(path)
                #loop for each item inside folder
                @folder_metadata['contents'].each do |file|
                    if file['is_dir'] == false
                        #make sure it is a file instead of folder
                        file_path = file['path']
                        file_name = Array.new
                        file_path.split('/').collect do |item|
                            file_name << item
                        end

                        puts "the file path is #{file['path']}"
                        puts "the file name is #{file_name.last}"
                        puts "the date is #{file['modified']}"

                        audiopost = show.audioposts.find_by_title(file_name.last)
                        if audiopost == nil 
                            url = client.media(file_path)
                            audiopost = show.audioposts.create(:title=>file_name.last, :audio=>url['url'], :user_id=>user.id, :audio_date=>file['modified'])
                        end
                    end
                end
            end
        end

        render :text => "Successfully Sync to latest (Brute Force) "

    end


    def testing 
        @token = session[:access_token]

        #get the dropbox client, will redirect for auth if user has not login
        client = get_dropbox_client
        unless client
            redirect_to(:action => 'auth_start') and return
        end

        user = User.find_by_email("b@b.com")
        if user == nil
            user = User.create!(:name=>"Dropbox Testing", :password=>"dropbox", :email=>"b@b.com")
        end

        #create boxcast station if it is not created
        station = user.stations.find_by_name('JustCast') 
        if station == nil
            station = Station.create!(:name=>"JustCast", :user_id=>user.id)
        end

        @urls = Array.new
        @cursor = user.cursor
        @delta = client.delta(user.cursor)
        # save the cursor to database
        user.cursor = @delta['cursor']
        user.save
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
                        audiopost = show.audioposts.find_by_title(folder_names.last)
                        if audiopost != nil 
                            audiopost.destroy()
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
                        show = station.shows.create!(:name=>folder_names.last, :djname=>nil, :description=>nil, :category=>"JustCast", :show_url=>nil, :user_id=>user.id) 
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
                    audiopost = show.audioposts.find_by_title(file_names.last)
                    if audiopost != nil
                        audiopost.destroy #destroy the old one in case it is replacement file, always destroy old record
                    end
                    url = client.media(path)
                    audiopost = show.audioposts.create(:title=>file_names.last, :audio=>url['url'], :user_id=>user.id, :audio_date=>metadata['modified'])
                end

            end

            puts "the path is #{path}"
            puts "the metadata is #{metadata}"

        end

        @root_metadata = client.metadata('/')
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

    
    def create
        client = get_dropbox_client
        unless client
            redirect_to(:action => 'auth_start') and return
        end

        begin
            #Create a folder Dropbox with given name            
            resp = client.file_create_folder('ilovela')
            render :text => "Create successful.  File now at #{resp['path']}"
        rescue DropboxAuthError => e
            session.delete(:access_token)  # An auth error means the access token is probably bad
            logger.info "Dropbox auth error: #{e}"
            render :text => "Dropbox auth error"
        rescue DropboxError => e
            logger.info "Dropbox API error: #{e}"
            render :text => "Dropbox API error"
        end        
    end

    def upload
        client = get_dropbox_client
        unless client
            redirect_to(:action => 'auth_start') and return
        end

        begin
            # Upload the POST'd file to Dropbox, keeping the same name
            resp = client.put_file(params[:file].original_filename, params[:file].read)
            render :text => "Upload successful.  File now at #{resp['path']}"
        rescue DropboxAuthError => e
            session.delete(:access_token)  # An auth error means the access token is probably bad
            logger.info "Dropbox auth error: #{e}"
            render :text => "Dropbox auth error"
        rescue DropboxError => e
            logger.info "Dropbox API error: #{e}"
            render :text => "Dropbox API error"
        end
    end

    def get_dropbox_client
        if session[:access_token]
            begin
                access_token = session[:access_token]
                current_user.token = access_token
                current_user.save
                DropboxClient.new(access_token)
            rescue
                # Maybe something's wrong with the access token?
                session.delete(:access_token)
                raise
            end
        end
    end

    def get_web_auth()
        redirect_uri = url_for(:action => 'auth_finish')
        DropboxOAuth2Flow.new(APP_KEY, APP_SECRET, redirect_uri, session, :dropbox_auth_csrf_token)        
    end

    def auth_start
        authorize_url = get_web_auth().start()

        # Send the user to the Dropbox website so they can authorize our app.  After the user
        # authorizes our app, Dropbox will redirect them here with a 'code' parameter.
        redirect_to authorize_url
    end

    def auth_finish
        begin
            access_token, user_id, url_state = get_web_auth.finish(params)
            session[:access_token] = access_token
            redirect_to :action => 'main'
        rescue DropboxOAuth2Flow::BadRequestError => e
            render :text => "Error in OAuth 2 flow: Bad request: #{e}"
        rescue DropboxOAuth2Flow::BadStateError => e
            logger.info("Error in OAuth 2 flow: No CSRF token in session: #{e}")
            redirect_to(:action => 'auth_start')
        rescue DropboxOAuth2Flow::CsrfError => e
            logger.info("Error in OAuth 2 flow: CSRF mismatch: #{e}")
            render :text => "CSRF error"
        rescue DropboxOAuth2Flow::NotApprovedError => e
            render :text => "Not approved?  Why not, bro?"
        rescue DropboxOAuth2Flow::ProviderError => e
            logger.info "Error in OAuth 2 flow: Error redirect from Dropbox: #{e}"
            render :text => "Strange error."
        rescue DropboxError => e
            logger.info "Error getting OAuth 2 access token: #{e}"
            render :text => "Error communicating with Dropbox servers."
        end
    end
end
