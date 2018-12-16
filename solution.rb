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
  three_word_combinations.sort {|a1, a2| a2[1] <=> a1[1] }.first(100).each { |phrase, total|
    puts "#{total} - #{phrase}"
  }
end

# ---- entry point ---
input = ARGF.read
count_stdin(input)
