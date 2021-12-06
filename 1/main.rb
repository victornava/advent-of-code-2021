def part_1(input)
  measurements = input.split(/\n/).map(&:to_i)
  measurements
    .each_cons(2)
    .select { |a, b| b > a }
    .size 
end

def part_2(input)
  measurements = input.split(/\n/).map(&:to_i)
  measurements
    .each_cons(3)
    .map { |xs| xs.sum }
    .each_cons(2)
    .select { |a, b| b > a }
    .size
end

def test(meth, args, target)
  output = meth.call(*args)
  puts "---"
  puts "target: #{target}"
  puts "output: #{output}"
  puts "pass: #{output == target ? '✅' : '❌'}"
end

test method(:part_1), [File.read("example.txt")], 7
test method(:part_1), [File.read("input.txt")], 1752 # Answer
test method(:part_2), [File.read("example.txt")], 5
test method(:part_2), [File.read("input.txt")], 1781 # Answer