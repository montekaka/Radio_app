class Station < ActiveRecord::Base
  has_many :shows
  belongs_to :user

  validates :user_id, presence: true
end
