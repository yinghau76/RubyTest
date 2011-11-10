def con_loop
  for i in 1..5 do
    puts i
    callcc { |a| return a } if i == 2
    puts '#'
  end
  return nil
end

puts 'Before loop call'
cont = con_loop()
puts cont.inspect
puts 'After loop call'
cont.call if cont
puts 'After continuation call'