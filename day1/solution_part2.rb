list_one = []
list_two = []
frequency = Hash.new(0)
similarity_score = []


File.foreach("input.txt") do |line|
  line_values = line.split(" ")
  list_one << line_values[0].to_i
  list_two << line_values[1].to_i
end


list_two.each do |id|
  frequency[id] += 1
end

list_one.each do |id|
  similarity_score << id * frequency[id]
end


puts "answer is #{similarity_score.sum}"