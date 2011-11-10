def method2
  puts "::method2"
end

def callmethod2
  method2
end

class Foo
  def self.method1
    puts "method1"
    callmethod2
  end

  def self.method2
    puts "Foo::method2"
  end
end

callmethod2
Foo.method1