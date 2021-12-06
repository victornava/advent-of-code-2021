def part_1(input)
  numbers = input.split(/\n/)
  gama = ""
  epsilon = ""
  
  numbers.first.size.times do |i|
    tally = { "0" => 0, "1" => 0 }
    numbers.map do |n|
      tally[n[i]] +=1
    end
    gama[i] = tally.max_by { |_, v| v }.first
    epsilon[i] = tally.min_by { |_, v| v }.first
  end
  gama.to_i(2) * epsilon.to_i(2)
end

def part_2(input)
  numbers = input.split(/\n/)
  n_size = numbers.first.size
  
  # Oxigen
  oxigen = numbers.clone
  n_size.times do |pos|
    tally = { "0" => 0, "1" => 0 }
    oxigen.map { |n| tally[n[pos]] +=1 }
    if tally["0"] == tally["1"]
      filter = "1"
    else
      filter = tally.max_by { |_, v| v }.first
    end
    oxigen = oxigen.select {|n| n[pos] == filter }    
    break if oxigen.size == 1
  end
  
  # CO2
  co2 = numbers.clone
  n_size.times do |pos|
    tally = { "0" => 0, "1" => 0 }
    co2.map { |n| tally[n[pos]] +=1 }
    if tally["0"] == tally["1"]
      filter = "0"
    else
      filter = tally.min_by { |_, v| v }.first
    end
    co2 = co2.select {|n| n[pos] == filter }    
    break if co2.size == 1
  end
  
  oxigen.first.to_i(2) * co2.first.to_i(2)
end


def test(meth, args, target)
  output = meth.call(*args)
  puts "---"
  puts "target: #{target}"
  puts "output: #{output}"
  puts "pass: #{output == target ? '✅' : '❌'}"
end

test method(:part_1), [File.read("example.txt")], 198
test method(:part_1), [File.read("input.txt")], 1307354 # Answer 1
test method(:part_2), [File.read("example.txt")], 230
test method(:part_2), [File.read("input.txt")], 482500 # Answer 2