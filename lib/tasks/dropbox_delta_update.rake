namespace :tweets do
	# to call the task with parameters
	# rake 'tweets:dropbox_delta_update[josh, hello]'
	desc "Check delta from dropbox"
	task :dropbox_delta_update, [:user_email, :station_name] => [:environment] do |t, args|
		user = args[:user_email]
		puts user + args[:station_name]
	end
end
