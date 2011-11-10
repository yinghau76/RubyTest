class VU
  include Comparable
  attr :volume
  
  def initialize(volume) # 0..9
    @volume = volume
  end

  def inspect
    '#' * @volume
  end
  
  # Support for ranges
  def <=>(other)
    self.volume <=> other.volume
  end

  def succ
    raise(IndexError, "Volume too big") if @volume >= 9
    VU.new(@volume.succ)
  end
end

medium_volume = VU.new(4)..VU.new(7)
puts medium_volume.to_a.inspect
medium_volume.include?(VU.new(3))