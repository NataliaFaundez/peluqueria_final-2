class AddVendidosToInventary < ActiveRecord::Migration[5.0]
  def change
    add_column :inventaries, :vendidos, :integer, default: 0
  end
end
