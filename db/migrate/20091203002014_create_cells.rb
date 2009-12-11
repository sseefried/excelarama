class CreateCells < ActiveRecord::Migration
  def self.up
    create_table :cells do |t|
      t.string  :contents
      t.integer :row
      t.integer :column
      t.references :excel_file

      t.timestamps
    end
  end

  def self.down
    drop_table :cells
  end
end
