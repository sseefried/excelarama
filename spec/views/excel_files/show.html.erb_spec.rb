require 'spec_helper'

describe "/excel_files/show.html.erb" do
  include ExcelFilesHelper
  before(:each) do
    assigns[:excel_file] = @excel_file = stub_model(ExcelFile,
      :path => "value for path"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ path/)
  end
end
