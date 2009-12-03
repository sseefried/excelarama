class CreateCells < ActiveRecord::Migration
  def self.up
    create_table :cells do |t|
      t.string :contents
      t.integer :row
      t.string :column

      t.timestamps
    end
  end

  def self.down
    drop_table :cells
  end
end
