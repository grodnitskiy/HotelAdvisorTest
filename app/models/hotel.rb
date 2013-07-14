class Hotel < ActiveRecord::Base
  attr_accessible :address_city, :address_country, :address_state, :address_street, :breakfast, :photo_hotel, :price_for_room, :rating, :room_desc, :title, :userRateCount
  mount_uploader :photo_hotel, PhotoHotelUploader
  has_many :comments , :class_name => 'Comment'
  validates :address_city, :presence => true
  validates :address_country, :presence => true
  validates :address_state, :presence => true
  validates :address_street, :presence => true
  validates :photo_hotel, :presence => true
  validates :room_desc, :presence => true
  validates :title, :presence => true
  validates :price_for_room, :presence => true
end
