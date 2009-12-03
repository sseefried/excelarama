require 'spec_helper'

describe "/excel_files/new.html.erb" do
  include ExcelFilesHelper

  before(:each) do
    assigns[:excel_file] = stub_model(ExcelFile,
      :new_record? => true,
      :path => "value for path"
    )
  end

  it "renders new excel_file form" do
    render

    response.should have_tag("form[action=?][method=post]", excel_files_path) do
      with_tag("input#excel_file_path[name=?]", "excel_file[path]")
    end
  end
end
