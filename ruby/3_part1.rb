# https://adventofcode.com/2024/day/3

MEMORY = File.read('./puzzle_input/3.txt')

VALID_COMMANDS = MEMORY.scan(/mul\([0-9]+,[0-9]+\)/)

result = 0

VALID_COMMANDS.each do |command|
  operands = command.split(/[()]/)[1].split(',')
  result += operands[0].to_i * operands[1].to_i
end

puts result
