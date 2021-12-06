def part_1(input)
  h = 0
  d = 0
  a = 0

  input.each_line do |l|
    action = l.split[0]
    val = l.split[1].to_i
    case action
    when "forward"
      h += val
    when "down"
      d += val
    when "up"
      d -= val
    end
  end
  h * d
end

def part_2(input)
  h = 0
  d = 0
  a = 0

  input.each_line do |l|
    action = l.split[0]
    val = l.split[1].to_i
    case action
    when "forward"
      h += val
      d += a * val
    when "down"
      a += val
    when "up"
      a -= val
    end
  end

  h * d
end

def test(meth, args, target)
  output = meth.call(*args)
  puts "---"
  puts "target: #{target}"
  puts "output: #{output}"
  puts "pass: #{output == target ? '✅' : '❌'}"
end

test method(:part_1), [File.read("example.txt")], 150
test method(:part_1), [File.read("input.txt")], 2091984 # Answer 1
test method(:part_2), [File.read("example.txt")], 900
test method(:part_2), [File.read("input.txt")], 2086261056 # Answer 2