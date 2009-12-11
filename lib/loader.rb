class Loader

  def initialize(path)
    @excel = Excelx.new(path)
    @path = path
  end

  def load
    # Blow away anything that is there.
    Cell.destroy_all
    @excel.default_sheet = @excel.sheets.first
    (@excel.first_row..@excel.last_row).each do |row|
      (@excel.first_column..@excel.last_column).each do |col|
        contents = if @excel.formula?(row, col)
                     @excel.formula(row,col)
                   else
                     @excel.cell(row,col)
                   end
        ef = ExcelFile.create({:path => @path, 
                                :first_column => @excel.first_column,
                                :first_row => @excel.first_row,
                                :last_column => @excel.last_column,
                                :last_row => @excel.last_row })

        Cell.create({:row => row, :column => col, 
                      :contents => contents, :excel_file_id => ef.id})

      end
    end
  end

end
