string = <<END_OF_STRING
The body of the string
is the input lines up to
one ending with the same
text that followed the '<<'
END_OF_STRING
puts string

foo, bar = ["foo", "bar"]
puts foo
puts bar

mins, secs = "11:54".scan(/\d+/)
puts mins, secs

File.open("song_data.txt") do |song_file|
  song_file.each do |line|
    file, length, name, title = line.chomp.split(/\s*\|\s*/)
    name.squeeze!(" ")
    puts file, length, name, title
  end
end

%q/general single quoted string/
%Q!general double quoted string!

%Q{Seconds/day: #{24*60*60}}
puts %W{ foo bar }

%x[]
print <<-STRING1, <<-STRING2
Concat
  STRING1
    enate
      STRING2