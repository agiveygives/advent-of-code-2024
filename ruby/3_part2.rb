# https://adventofcode.com/2024/day/3

MEMORY = File.read('./puzzle_input/3.txt')

VALID_COMMANDS = MEMORY
  .scan(/(do\(\)|don\'t\(\)|mul\([0-9]+,[0-9]+\))/)
  .flatten

result = 0

enabled = true
VALID_COMMANDS.each do |command|
  if command == "do()"
    enabled = true
  elsif command == "don't()"
    enabled = false
  else
    next unless enabled

    operands = command.split(/[()]/)[1].split(',')
    result += operands[0].to_i * operands[1].to_i
  end
end

puts result
