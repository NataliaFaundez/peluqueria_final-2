class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      
      t.references :client, foreign_key: true, index:true
      t.references :service, foreign_key: true, index:true
      t.references :user, foreign_key: true, index:true
      t.string :anotacion
      t.integer :valor
      t.decimal :comision
      t.integer :boleta
      t.date :fecha
      t.string :medio_pago
      t.boolean :activo , :default => true
      t.boolean :estado , :default => true
      t.boolean :pagado , :default => true

      t.timestamps
    end
  end
end
