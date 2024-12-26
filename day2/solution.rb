input = []
safe = 0
unsafe = 0

File.foreach("input.txt") do |line|
  line_values = line.split(" ")
  input << line_values.map { |number| number.to_i }
end


def evaluate_sign_changes(array)
  change_frequency = Hash.new(0)
  changes = array.map { |number| number > 0 ? 0 : 1 }
  changes.each do |change|
    change_frequency[change] += 1
  end

  if change_frequency[0].positive? && change_frequency[1].positive?
    return false
  end

  true
end


input.each do |report|
  i = report.length
  diff_sign = []
  (i - 1).times do |j|
    p1 = report[j]
    p2 = report[j + 1]

    diff = p1 - p2
    if diff != 0 && diff < 4 && diff > -4
      diff_sign << diff
    end

  end

  if diff_sign.length == (i - 1)
    sign_change = evaluate_sign_changes(diff_sign)
  end

  if sign_change
    safe += 1
  else
    unsafe += 1
  end
end

puts safe
puts unsafe




