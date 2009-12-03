require 'spec_helper'

describe "/cells/new.html.erb" do
  include CellsHelper

  before(:each) do
    assigns[:cell] = stub_model(Cell,
      :new_record? => true,
      :contents => "value for contents",
      :row => 1,
      :column => "value for column"
    )
  end

  it "renders new cell form" do
    render

    response.should have_tag("form[action=?][method=post]", cells_path) do
      with_tag("input#cell_contents[name=?]", "cell[contents]")
      with_tag("input#cell_row[name=?]", "cell[row]")
      with_tag("input#cell_column[name=?]", "cell[column]")
    end
  end
end
