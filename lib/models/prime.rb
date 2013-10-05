class Prime

  attr_accessor :value

  class << self
    
    def all
      return @all if @all
      num_primes = @num_primes || 10
      first_prime = Prime.new(:value => 2)
      @all = (num_primes-1).times.inject([first_prime]) do |primes, i|
        primes << primes.last.next_prime
      end
    end
    
    def is_prime?(int)
      return false if int.to_i <= 1 
      int == 2 || is_divisible?(int)
    end
    
    def print_int(int)
      "#{int}" + (' ' * (print_width - int.to_s.length))
    end

    def print_table(num_primes)
      @num_primes = num_primes
      all_primes_string = '  ' + all.join(' ')
      puts ''
      puts (' ' * print_width) + all_primes_string
      puts (' ' * print_width) + ('_' * all_primes_string.length)
      all.each do |prime|
        puts prime.print_line
      end
      puts ''
    end

    private
    def is_divisible?(int)
      (2..(int-1)).none? {|i| (int % i) == 0}
    end

    def print_width
      (all.last.value * all.last.value).to_s.length + 1
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

  def print_line
    products = Prime.all.collect {|p| Prime.print_int(p.value * value)}
    "#{self}| #{products.join(' ')}"
  end

  def to_s
    Prime.print_int(value)
  end

end

Prime::DEFAULT_COUNT = 10