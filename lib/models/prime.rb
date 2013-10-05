class Prime

  attr_accessor :value

  class << self
    
    def all
      primes = [Prime.new(:value => 2)]
      9.times.inject(primes) do |primes, i|
        primes << primes.last.next_prime
      end
    end
    
    def is_prime?(int)
      return false if int.to_i <= 1 
      int == 2 || is_divisible?(int)
    end
    
    def is_divisible?(int)
      (2..(int-1)).none? {|i| (int % i) == 0}
    end
    
  end

  def initialize(attrs = {})
    attrs.each do |attr, value|
      send("#{attr}=", value)
    end
  end

  def next_prime
    int = value + 1
    until Prime.is_prime?(int) do
      int += 1
    end
    Prime.new(:value => int)
  end

end