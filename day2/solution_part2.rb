input = []
safe = 0
unsafe = 0

File.foreach("input.txt") do |line|
  line_values = line.split(" ")
  input << line_values.map { |number| number.to_i }
end


## delete my old crap solution, now using more concise functions
#

def is_safe?(nums)
  inc = nums[1] > nums[0]
  if inc
    (1...nums.length).each do |i|
      diff = nums[i] - nums[i - 1]
      return false unless (1..3).include?(diff)
    end
  else
    (1...nums.length).each do |i|
      diff = nums[i] - nums[i - 1]
      return false unless (-3..-1).include?(diff)
    end
  end
  true
end

def check_if_is_really_safe?(nums)
  return true if is_safe?(nums)
  nums.length.times do |i|
    return true if is_safe?(nums[0...i] + nums[i+1..-1])
  end
  false
end

input.each do |report|
  if check_if_is_really_safe?(report)
    safe += 1
  else
    unsafe += 1
  end
end

puts safe
puts unsafe
