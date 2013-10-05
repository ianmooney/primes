class Prime

  attr_accessor :value

  class << self
    
    def all(count = Prime::DEFAULT_COUNT)
      first_prime = Prime.new(:value => 2)
      (count-1).times.inject([first_prime]) do |primes, i|
        primes << primes.last.next_prime
      end
    end
    
    def is_prime?(int)
      return false if int.to_i <= 1 
      int == 2 || is_divisible?(int)
    end
    
    def print_int(int)
      "#{int}" + (' ' * (Prime::PRINT_WIDTH - int.to_s.length))
    end

    def print_table(count = Prime::DEFAULT_COUNT)
      all_primes_string = '  ' + Prime.all(count).join(' ')
      puts ''
      puts (' ' * Prime::PRINT_WIDTH) + all_primes_string
      puts (' ' * Prime::PRINT_WIDTH) + ('_' * all_primes_string.length)
      Prime.all(count).each do |prime|
        puts prime.print_line(count)
      end
      puts ''
    end

    private
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

  def print_line(count = Prime::DEFAULT_COUNT)
    products = Prime.all(count).collect {|p| Prime.print_int(p.value * value)}
    "#{self}| #{products.join(' ')}"
  end

  def to_s
    Prime.print_int(value)
  end

end

Prime::PRINT_WIDTH = 4
Prime::DEFAULT_COUNT = 10