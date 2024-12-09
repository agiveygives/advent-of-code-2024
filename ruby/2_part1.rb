# https://adventofcode.com/2024/day/2

REPORTS = File.read('./puzzle_input/2.txt')
  .split("\n")
  .map do |report|
    levels = report.split(' ')
    levels.map(&:to_i)
  end

safe_reports = 0

REPORTS.each do |report|
  next if report[0] == report[1]
  direction = report[0] > report[1] ? :desc : :asc

  report.each_with_index do |curr_level, index|
    if index == report.size - 1
      safe_reports += 1
      break
    end

    next_level = report[index + 1]

    case direction
    when :desc
      difference = curr_level - next_level
      break if difference <= 0 || difference > 3
    when :asc
      difference = next_level - curr_level
      break if difference <= 0 || difference > 3
    else
      break
    end
  end
end

puts safe_reports
