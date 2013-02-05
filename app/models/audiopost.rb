class Audiopost < ActiveRecord::Base
	attr_accessible :title, :short_note, :user_id, :audio, :audio_date
	
	belongs_to :user
     belongs_to :show

	validates :short_note, :length=>{ :maximum => 140 }
	validates :title, :length=>{ :maximum => 50 }
end
