require 'spec_helper'

describe "/excel_files/index.html.erb" do
  include ExcelFilesHelper

  before(:each) do
    assigns[:excel_files] = [
      stub_model(ExcelFile,
        :path => "value for path"
      ),
      stub_model(ExcelFile,
        :path => "value for path"
      )
    ]
  end

  it "renders a list of excel_files" do
    render
    response.should have_tag("tr>td", "value for path".to_s, 2)
  end
end
