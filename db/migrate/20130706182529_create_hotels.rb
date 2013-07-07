class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :title
      t.text :room_desc
      t.float :price_for_room
      t.integer :rating
      t.boolean :breakfast
      t.string :address_country
      t.string :address_state
      t.string :address_city
      t.string :address_street
      t.string :photo_hotel

      t.timestamps
    end
  end
end
