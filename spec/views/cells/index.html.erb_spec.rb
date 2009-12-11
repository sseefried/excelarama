require 'spec_helper'

describe "/cells/index.html.erb" do
  include CellsHelper

  before(:each) do
    assigns[:cells] = [
      stub_model(Cell,
        :contents => "value for contents",
        :row => 1,
        :column => 1
      ),
      stub_model(Cell,
        :contents => "value for contents",
        :row => 1,
        :column => 1
      )
    ]
  end

  it "renders a list of cells" do
    render
    response.should have_tag("tr>td", "value for contents".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
