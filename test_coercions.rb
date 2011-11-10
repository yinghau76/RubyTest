class OneTwo
  
  def to_ary
    [1, 2]
  end
  
  def to_proc
    proc { "one-two" }
  end
  
  def to_str
    "one-two"
  end
  
end

ot = OneTwo.new
puts ot.respond_to?(:to_ary)

a, b = ot
puts "a = #{a}, b = #{b}"
printf("%d -- %d\n", *ot)

def silly
  yield
end

puts silly(&ot)

puts "Count: " + ot