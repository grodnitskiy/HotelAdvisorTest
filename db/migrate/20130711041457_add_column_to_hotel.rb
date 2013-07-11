class AddColumnToHotel < ActiveRecord::Migration
  def change
    add_column :Hotels, :userRateCount, :integer
  end
end
