require "pp"


def parse(filename,delimiter=",",quote="\"")
  csv_data = File.read(filename)
  lines = csv_data.split("\n")
  results = []
  lines.each do |line|
    row = []
    field = ""
    ignore_commas = false
    line.each_char.with_index do |char, index|
      if char == delimiter && !ignore_commas
        row << field
        field = ""
      elsif char == quote
        if line[index + 1] == quote
          field << char
        elsif line[index - 1] == quote
          next
        else
          ignore_commas = !ignore_commas
        end
      else
        field << char
      end
    end
    row << field
    results << row
  end
  results
end

puts parse("routes.csv")
