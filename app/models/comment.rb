class Comment < ActiveRecord::Base
  attr_accessible :hotel_id, :text, :user_id
  belongs_to :hotel , :class_name => 'Hotel'
  belongs_to :user, :class_name => 'User'
  validates :user_id, presence: true
  validates :hotel_id, presence: true
end
