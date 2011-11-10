values = ["1", "2.3", /pattern/]
result = values.map begin |v| 
  Integer(v) rescue Float(v) rescue String(v)
end

puts result.inspect
