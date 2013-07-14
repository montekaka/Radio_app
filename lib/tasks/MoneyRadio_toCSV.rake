# # encoding: UTF-8
desc "Save Finance Advice in One and Half Minute in csv"
task :MoneyRadio_toCSV => :environment do
	require 'csv'	
	station = Station.find_by_name('節目重溫')
	showa = station.shows.find_by_name('理財分半鐘')
	puts showa.name
	CSV.open("myfile.csv", "w") do |csv|
		showa.audioposts.each do |audiopost|
			csv << [audiopost.audio_date, audiopost.title]
		end
	end
	# CSV.open("myfile.csv", "w") do |csv|
	# 	csv << ["row", "of", "CSV", "data"]
	# 	csv << ["another", "row"]
	# end
end