class Audiopost < ActiveRecord::Base
	attr_accessible :title, :short_note, :user_id, :audio, :audio_date, :soundfile
  has_attached_file :soundfile  

	validates :short_note, :length=>{ :maximum => 100000 }
	validates :title, :length=>{ :maximum => 100 }, :presence => :true	
	validates_attachment :soundfile, content_type: {content_type: ['audio/mp4', 'audio/mpeg', 'audio/mp3','audio/ogg', 'video/mp4']},
											 size: {less_than: 50.megabytes}

	belongs_to :user
  belongs_to :show
  validates :user_id, presence: true
end