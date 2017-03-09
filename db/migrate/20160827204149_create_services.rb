class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :nombre
      t.integer :valor
      t.boolean :estado, default: true

      t.timestamps
    end
  end
end
