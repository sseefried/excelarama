require 'spec_helper'

describe "/main/show.html.erb" do
  include MainHelper

  before(:each) do
    assigns[:excel_file] = 
       stub_model(ExcelFile,
                   :path => "/some/path",
                   :first_column => 1,
                   :first_row => 2,
                   :last_column => 2,
                   :last_row => 2)
      
  end

  it "renders the table" do
    render
    response.should have_tag("tr>th", "A")
    response.should have_tag("tr>th", "B")
 #   response.should have_tag("tr>td", "1")
    response.should have_tag("tr>th", "2")
  end

end
