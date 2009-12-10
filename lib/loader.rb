class Loader

  def initialize(path)
    @excel = Excelx.new(path)
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
        Cell.create({:row => row, :column => Excelx.number_to_letter(col), 
                      :contents => contents})
      end
    end
  end

end
