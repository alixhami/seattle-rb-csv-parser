require "pp"


def parse(filename,delimiter)
  csv_data = File.read(filename)
  csv_data.split("\n").map {|line| line.split(delimiter)}
end

pp parse("dogs.csv",",")
