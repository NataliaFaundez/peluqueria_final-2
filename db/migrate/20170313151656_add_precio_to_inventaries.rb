class AddPrecioToInventaries < ActiveRecord::Migration[5.0]
  def change
    add_column :inventaries, :precio, :integer
  end
end
