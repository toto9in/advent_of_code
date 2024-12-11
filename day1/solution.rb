list_one = []
list_two = []
distances = []


File.foreach("input_example.txt") do |line|
  line_values = line.split(" ")
  list_one << line_values[0].to_i
  list_two << line_values[1].to_i
end



i = list_one.length

i.times do
  if list_one.length == 0 || list_two.length == 0
    break
  end
    min_list_one = list_one.min
    min_list_two = list_two.min
    distances << (min_list_one - min_list_two).abs
    list_one.delete_at(list_one.index(min_list_one))
    list_two.delete_at(list_two.index(min_list_two))
end

puts distances.inspect

puts "answer is #{distances.sum}"


## part two
