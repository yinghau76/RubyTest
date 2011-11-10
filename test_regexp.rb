a = Regexp.new('^\s*[az]')
b = /^\s*[az]/
c = %r{^\s*[az]}

def show_regexp(a, re)
  if a =~ re
    "#{$`}<<#{$&}>>#{$'}"
  else
    "no match"
  end
end

puts show_regexp('very interesting', /t/)
puts show_regexp('Fats Waller', /a/)
puts show_regexp('Fats Waller', /ll/)
puts show_regexp('Fats Waller', /z/)