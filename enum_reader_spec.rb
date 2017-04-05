require 'enum_reader'

describe EnumReader do
  it "can read num bytes" do
    s = %W(test 12 34 5).each
    r = EnumReader.new(s)

    r.read(1).should == "t"
    r.read(3).should == "est"
    r.read(4).should == "1234"
    r.read(1).should == "5"
    r.read(2).should == nil

    r.pos.should == s.to_a.join.length
  end
end
