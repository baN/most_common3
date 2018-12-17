#!/usr/bin/env ruby

require_relative 'common'


# ---- entry point ---
input = ARGF.read
count_stdin(input).each {|phrase, count|
  puts "#{count} #{phrase}"
}
