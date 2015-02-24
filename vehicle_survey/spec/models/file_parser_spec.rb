require 'spec_helper'

describe FileParser do

  it 'should read the file' do
    parsed_input = FileParser.read_file 'lib/stubs/Vehicle_Survey.txt'
    parsed_input.length.should == 2
    parsed_input[0].should == [[98186, 98333],
                               [499718, 499886],
                               [1016488, 1016648],
                               [2146213, 2146349],
                               [2211004, 2211128],
                               [2695213, 2695369],
                               [3318189, 3318355],
                               [7051179, 7051310]]
    parsed_input[1].should == [[638379, 638520],
                               [1058535, 1058659],
                               [1201386, 1201539],
                               [1624044, 1624188],
                               [1782481, 1782660],
                               [2422884, 2423013],
                               [2597513, 2597667],
                               [3280268, 3280386],
                               [4021664, 4021806],
                               [4455194, 4455327],
                               [5060792, 5060911],
                               [5411133, 5411294],
                               [5508987, 5509166],
                               [5810441, 5810600],
                               [6383154, 6383348]]
  end

  it 'should separate direction from seconds' do
    FileParser.parse_record('A98186').should == [0, 98186]
  end

  it 'should return unexpected record b exception' do
    expect { FileParser.read_file 'lib/stubs/Vehicle_Survey_Exception.txt' }.to raise_error(FileParseException::UnexpectedRecord)
  end
end
