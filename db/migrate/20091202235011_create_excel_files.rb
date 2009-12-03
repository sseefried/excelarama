class CreateExcelFiles < ActiveRecord::Migration
  def self.up
    create_table :excel_files do |t|
      t.string :path

      t.timestamps
    end
  end

  def self.down
    drop_table :excel_files
  end
end
