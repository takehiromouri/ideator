class Idea < ActiveRecord::Base
	validates :description, :user_id, presence: true
  validates :description, length: { maximum: 140 }  
  belongs_to :user
end
