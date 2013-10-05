require 'spec_helper'

ACTUAL_PRIMES = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
NON_PRIMES = [0, 1, 4, 6, 8, 9, 10, 12, 14, 15]

describe Prime do

  describe '::all' do
    it 'returns first 10 prime numbers' do
      expect(Prime.all.collect(&:value)).to match_array(ACTUAL_PRIMES)
    end
  end
  
  describe '::is_prime?' do
    context 'not given a prime' do
      NON_PRIMES.each do |int|
        it "is false when given #{int}" do
          expect(Prime.is_prime?(int)).to be_false
        end
      end
    end
    context 'given a prime' do
      ACTUAL_PRIMES.each do |int|
        it "is false when given #{int}" do
          expect(Prime.is_prime?(int)).to be_true
        end
      end
    end
  end

  describe '#next_prime' do
    ACTUAL_PRIMES.each_with_index do |int, index|
      prime = Prime.new(:value => int)
      if next_actual_prime = ACTUAL_PRIMES[index+1]
        it "is #{next_actual_prime} when currently #{int}" do
          expect(prime.next_prime.value).to eq(next_actual_prime)
        end
      end
    end
  end
  
end
