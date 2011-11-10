# you need to declare foo before the lamdba
foo = nil
a = lambda { puts foo }

foo = 100
a.call # will show the correct value of foo

def refer_to_foo
  puts foo # unlike block, method cannot access its context
end