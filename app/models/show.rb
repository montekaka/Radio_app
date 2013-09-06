class Show < ActiveRecord::Base
  	has_many :audioposts
  	belongs_to :station
  	belongs_to :user
end
