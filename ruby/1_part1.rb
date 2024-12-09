# https://adventofcode.com/2024/day/1

LIST_1 = []
LIST_2 = []
File.read('./puzzle_input/1.txt')
  .split("\n")
  .each do |line|
    data = line.split('   ')
    LIST_1.push(data[0].to_i)
    LIST_2.push(data[1].to_i)
  end

sorted_list_1 = LIST_1.sort
sorted_list_2 = LIST_2.sort
distances = []

sorted_list_1.each_with_index do |location, index|
  distance = (sorted_list_2[index] - location).abs
  distances.push(distance)
end

puts distances.sum
