class Idea < ActiveRecord::Base
	validates :description, :user_id, presence: true
  
  belongs_to :user
end
