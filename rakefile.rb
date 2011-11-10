
def build_tasks(arg)
  task :task1 do
    puts "task1: " + arg
  end
  task :default => :task1

  task :task2 do
    puts "task2: " + arg
  end
  task :default => :task2
end

namespace :ns1 do
  build_tasks("in ns1")
end

namespace :ns2 do
  build_tasks("in ns2")
end

task :default => ['ns1:default', 'ns2:default']