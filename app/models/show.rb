class Show < ActiveRecord::Base
  	has_many :audioposts
  	belongs_to :station
  	belongs_to :user

  	validates_presence_of :user_id, :name
end
