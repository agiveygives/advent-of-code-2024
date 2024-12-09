# https://adventofcode.com/2024/day/2#part2

REPORTS = File.read('./puzzle_input/2.txt')
  .split("\n")
  .map do |report|
    levels = report.split(' ')
    levels.map(&:to_i)
  end

def check_safety(report)
  return false if report[0] == report[1]
  direction = report[0] > report[1] ? :desc : :asc

  is_safe = false
  report.each_with_index do |curr_level, index|
    if index == report.size - 1
      is_safe = true
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

  is_safe
end

safe_reports = 0
REPORTS.each do |report|
  is_safe = check_safety(report)
  if is_safe
    safe_reports += 1
  else
    report_size = report.size

    (0..report_size - 1).each do |index|
      dampened_report = report.dup
      dampened_report.delete_at(index)

      if check_safety(dampened_report)
        safe_reports += 1
        break
      end
    end
  end
end

puts safe_reports
