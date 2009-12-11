require 'spec_helper'

describe "/cells/edit.html.erb" do
  include CellsHelper

  before(:each) do
    assigns[:cell] = @cell = stub_model(Cell,
      :new_record? => false,
      :contents => "value for contents",
      :row => 1,
      :column => 1
    )
  end

  it "renders the edit cell form" do
    render

    response.should have_tag("form[action=#{cell_path(@cell)}][method=post]") do
      with_tag('input#cell_contents[name=?]', "cell[contents]")
      with_tag('input#cell_row[name=?]', "cell[row]")
      with_tag('input#cell_column[name=?]', "cell[column]")
    end
  end
end
