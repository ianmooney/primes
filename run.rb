#!/usr/bin/ruby

require './lib/models/prime.rb'

number_of_primes = (ARGV[0] || 10).to_i

Prime.print_table(number_of_primes)