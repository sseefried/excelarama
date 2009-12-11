class CreateExcelCells < ActiveRecord::Migration
  def self.up
    create_table :excel_cells do |t|
      t.string  :contents
      t.integer :row
      t.integer :column
      t.boolean :is_formula
      t.references :excel_file
      t.timestamps
    end
  end

  def self.down
    drop_table :excel_cells
  end
end
