class FileParser
  DIR_A = 0
  DIR_B = 1

  def self.read_file(file_path)
    parsed_input = []
    dirs = [[], []]

    File.open(file_path).each_line do |line|
      direction, time = parse_record(line)
      parsed_input << time
      input_size = parsed_input.size
      if (input_size == 2 and direction == DIR_A) or (input_size == 4 and direction == DIR_B)
        parsed_input = [parsed_input[0], parsed_input[2]] if direction == DIR_B
        dirs[direction] << parsed_input
        parsed_input = []
      end
      if (input_size % 2 == 1 and direction == DIR_B) or (input_size == 4 and direction != DIR_B)
        raise FileParseException::UnexpectedRecord
      end
    end
    dirs
  end

  def self.parse_record(data)
    unpacked = data.unpack('a1a*')
    return unpacked[0] == 'A' ? DIR_A : DIR_B, unpacked[1].to_i
  end


end
