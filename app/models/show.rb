class Show < ActiveRecord::Base
  	has_many :audioposts
  	belongs_to :station
end
