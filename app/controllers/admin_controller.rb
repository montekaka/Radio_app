require 'dropbox_sdk'
require 'securerandom'


#APP_KEY = "xs74qq784d9t162"
#APP_SECRET = "06jeldwww4n7kl1"

# EasyCast (chan0123@hotmail.com)
APP_KEY = "vs7j8v1o8tgkpkc"
APP_SECRET = "z35iacsu4703i4v"

class AdminController < ApplicationController
  
    layout "admin"

	def signout
		if current_user
			sign_out current_user
			redirect_to root_path
		else
			puts "already sign out"
		end
	end

	def main

	 	if current_user == nil
			client = get_dropbox_client
			if client == nil 
				# try to get dropbox client by using session[:token]
	 			redirect_to(:action => 'auth_start') and return
			else
           		dropbox_id = client.account_info["uid"]
				user = User.find_by_dropbox_id(dropbox_id)
				if user == nil
					redirect_to(:action => 'auth_start') and return
				else
					puts "special case: people signin dropbox but signout justcast app"
					sign_in user
				end
			end
	 	end

	 	# the following code assume the user already log in
	 	@station = current_user.stations.first
	 	if @station != nil
	 		@shows = @station.shows
	 	end
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
           	client = DropboxClient.new(access_token)
            dropbox_id = client.account_info["uid"]
            puts "the dropbox id is #{dropbox_id}"
            puts "the dropbpx account_info is #{client.account_info.inspect}"
            # check with user table
            user = User.find_by_dropbox_id(dropbox_id)
            if user == nil
            	# create an user if it is not in the user table
            	password = Devise.friendly_token[0,20]
            	user = User.create!(:name=>client.account_info["display_name"], :token=>access_token, :dropbox_id=>dropbox_id, 
            						:password=>password, :password_confirmation=>password, :email=>client.account_info["email"])
            
            	# setup new user, create a station
            	station_name = client.account_info["display_name"] + " JustCast"
            	station = user.stations.create!(:name=>station_name)

            	# create an "example" show by putting files in dropbox
            	resp = client.file_create_folder("example")
            	#client.put_file('/example/test_file_on_dropbox.mp3', open('https://dl.dropboxusercontent.com/s/gmzjeuvlo8vmx5a/sample.mp3'))
            	user.sync_dropbox()
            end

            # log user in
            sign_in user
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
            render :text => "Error communicating with Dropbox servers. Please try again"
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

end
