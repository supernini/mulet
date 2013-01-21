class CreateLacFishByDates < ActiveRecord::Migration
  def change
    create_table :lac_fish_by_dates do |t|
      t.references :lac
      t.date :date
      t.decimal :fish_volume, :precision => 10, :scale => 2
      t.timestamps
    end
    add_index :lac_fish_by_dates, :lac_id
  end
end
