class AddColumnToComments < ActiveRecord::Migration
  def change
    add_column :Comments, :rate, :integer
  end
end
