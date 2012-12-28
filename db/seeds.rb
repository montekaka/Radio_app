# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)


Audiopost.destroy_all
Audiopost.create(:title => "俄敍通婚/通緝名單", :audio => "http://www.am1300.com/uploadfile/2012/0704/20120704022610296.mp3", :audio_date => "07/03/2012")
