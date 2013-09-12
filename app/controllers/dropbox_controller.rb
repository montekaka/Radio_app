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

    def testing 
        #get the dropbox client, will redirect for auth if user has not login
        client = get_dropbox_client
        unless client
            redirect_to(:action => 'auth_start') and return
        end

        user = User.find_by_email("a@a.com")
        if user == nil
            user = User.create!(:name=>"Roland", :password=>"aaaaaa", :email=>"a@a.com")
        end

        #create boxcast station if it is not created
        station = Station.find_by_name('JustCast') 
        if station == nil
            station = Station.create!(:name=>"JustCast", :user_id=>user.id)
        end

        @urls = Array.new
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
                show = Show.find_by_name(folder_name.last)
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
                        url = client.media(file_path)
                        @urls << url['url'] #add to urls array
                        audiopost = Audiopost.find_by_title("file_name.last")
                        if audiopost == nil 
                            audiopost = show.audioposts.create(:title=>file_name.last, :audio=>url['url'], :user_id=>user.id, :audio_date=>file['modified'])
                        end               

                    end
                end
            end
        end
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
