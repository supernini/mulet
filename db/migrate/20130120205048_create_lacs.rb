class CreateLacs < ActiveRecord::Migration
  def change
    create_table :lacs do |t|
      t.string :name
      t.decimal :longitude, :precision => 6, :scale => 4
      t.integer :initial_volume, :default => 0
      t.timestamps
    end
  end
end
