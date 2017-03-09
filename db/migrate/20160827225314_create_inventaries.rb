class CreateInventaries < ActiveRecord::Migration[5.0]
  def change
    create_table :inventaries do |t|
      t.string :nombre
      t.string :codigo
      t.integer :cantidad
      t.boolean :estado, default: true
      t.string :marca

      t.timestamps
    end
  end
end
