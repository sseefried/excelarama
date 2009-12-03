require 'spec_helper'

describe "/cells/show.html.erb" do
  include CellsHelper
  before(:each) do
    assigns[:cell] = @cell = stub_model(Cell,
      :contents => "value for contents",
      :row => 1,
      :column => "value for column"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ contents/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ column/)
  end
end
