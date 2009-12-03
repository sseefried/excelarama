require 'spec_helper'

describe "/excel_files/edit.html.erb" do
  include ExcelFilesHelper

  before(:each) do
    assigns[:excel_file] = @excel_file = stub_model(ExcelFile,
      :new_record? => false,
      :path => "value for path"
    )
  end

  it "renders the edit excel_file form" do
    render

    response.should have_tag("form[action=#{excel_file_path(@excel_file)}][method=post]") do
      with_tag('input#excel_file_path[name=?]', "excel_file[path]")
    end
  end
end
