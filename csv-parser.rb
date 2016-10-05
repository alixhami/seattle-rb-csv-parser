require "pp"


def parse(filename,delimiter=",",quote="\"")
  csv_data = File.read(filename)
  lines = csv_data.split("\n")
  results = []
  lines.each do |line|
    row = []
    field = ""
    ignore_commas = false
    line.each_char do |char|
      if char == delimiter && !ignore_commas
        row << field
        field = ""
      elsif char == quote
        ignore_commas = !ignore_commas
      else
        field << char
      end
    end
    row << field
    results << row
  end
  results
end

pp parse("cat_breeds.csv",",")
