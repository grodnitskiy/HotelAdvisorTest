class Hotel < ActiveRecord::Base
  attr_accessible :address_city, :address_country, :address_state, :address_street, :breakfast, :photo_hotel, :price_for_room, :rating, :room_desc, :title
  mount_uploader :photo_hotel, PhotoHotelUploader
  has_many :messages
end
