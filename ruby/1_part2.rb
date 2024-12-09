# https://adventofcode.com/2024/day/1#part2

LIST_1 = []
LIST_2 = []
File.read('./puzzle_input/1.txt')
  .split("\n")
  .each do |line|
    data = line.split('   ')
    LIST_1.push(data[0].to_i)
    LIST_2.push(data[1].to_i)
  end

