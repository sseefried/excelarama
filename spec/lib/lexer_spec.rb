require 'spec_helper'

include Lexer

describe "lexer" do
  it "should lex these strings" do
    ConstToken.new("1").should == ConstToken.new("1")
    lex("1+2").should == [ ConstToken.new("1"), PlusToken.new("+"), ConstToken.new("2") ]
    lex("$A2 + 3").should == [ CellToken.new("$A2"), PlusToken.new("+"), ConstToken.new("3") ]
  end

  it "should not lex these strings" do
    lambda { lex("1+%")}.should raise_error(RuntimeError, "Lexing failed on `%'")
    lambda { lex("1+2*&+2")}.should raise_error(RuntimeError, "Lexing failed on `&+2'")
  end
end


