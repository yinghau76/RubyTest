# case 1

require 'monitor'

class Counter
  attr_reader :count
  
  def initialize
    @count = 0
    @lock = Monitor.new
  end
  
  def tick
    @lock.synchronize do
      @count += 1
    end
  end
  
end

c = Counter.new
t1 = Thread.new { 10000.times { c.tick } }
t2 = Thread.new { 10000.times { c.tick } }
t1.join
t2.join

puts "c = #{c.count}"

# case 2

class Chaser
  attr_reader :count
  
  def initialize(name)
    @name = name
    @count = 0
  end
  
  def chase(other)
    while @count < 5
      while @count - other.count > 1
        Thread.pass
      end
      @count += 1
      print "#@name: #{count}\n"
    end
  end
  
end

c1 = Chaser.new("A")
c2 = Chaser.new("B")

threads = [
  Thread.new { Thread.stop; c1.chase(c2) },
  Thread.new { Thread.stop; c2.chase(c1) }
]

start_index = rand(2)
threads[start_index].run
threads[1 - start_index].run

threads.each {|t| t.join}