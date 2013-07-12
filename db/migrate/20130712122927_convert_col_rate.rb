class ConvertColRate < ActiveRecord::Migration
  def up
    remove_column :Hotels, :usercount
    remove_column :Hotels, :rating
    add_column :Hotels, :rating, :float
  end

  def down
  end
end