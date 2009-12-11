class Loader

  def initialize(path)
    @excel = Excelx.new(path)
    @path = path
  end

  def load
    @excel.default_sheet = @excel.sheets.first
    ExcelFile.destroy_all(['path = ?', @path])
    ef = ExcelFile.create({:path => @path, 
                                :first_column => @excel.first_column,
                                :first_row => @excel.first_row,
                                :last_column => @excel.last_column,
                                :last_row => @excel.last_row })

    # Blow away anything that is there.
    ExcelCell.destroy_all(['excel_file_id = ?', ef.id])

    (@excel.first_row..@excel.last_row).each do |row|
      (@excel.first_column..@excel.last_column).each do |col|
        contents = if @excel.formula?(row, col)
                     @excel.formula(row,col)
                   else
                     @excel.cell(row,col)
                   end
        is_formula = @excel.formula?(row,col)


        ExcelCell.create({:row => row, :column => col, 
                      :contents => contents, :excel_file_id => ef.id, 
                           :is_formula => is_formula})

      end
    end
    return ef.id
  end

end
