class CreateLacTemperatures < ActiveRecord::Migration
  def change
    create_table :lac_temperatures do |t|
      t.references :lac
      t.date :when_happen
      t.decimal :temperature

      t.timestamps
    end
    add_index :lac_temperatures, :lac_id
  end
end
