#!/usr/bin/env ruby

require_relative 'common'

def count_stdin(input)
  three_word_combinations = {} #map used for counting 3 word combos:counter

  # Iterate each line and parse three word combinations
  input.each_line.lazy.each { |stream|
    array = words_from_string(stream)

    parsed_phrases = phrases(array, 3) #get enumerator of all 3 word combos

    parsed_phrases.each { |phrase| #scan the array of 3word combos
      if three_word_combinations.include?(phrase)
        three_word_combinations[phrase] += 1
      else  #if key (3 word combo) has not been encountered create it
        three_word_combinations[phrase] = 1
      end
    }
  }

  # Sort phrase combinations and totals descending, show only first 100
  # sorted = three_word_combinations.sort{|x,y| y <=> x} #reverse 3word:count => count:3word
  sorted = three_word_combinations.sort_by{ |combo| combo[1]}.last(100)
  sorted.each {|phrase, count|
    puts "#{count} #{phrase}"
  }

end

# ---- entry point ---
input = ARGF.read
count_stdin(input)
