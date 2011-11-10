def meth1
  puts "before calling meth2"
  meth2 { return }
  puts "after calling meth2"
  meth3 { return }
end

def meth2
  puts "before yield"
  yield
  puts "after yield"
end

def meth3(&b)
  b
end

t = Thread.new do
  meth2 { return }
end

t.join
