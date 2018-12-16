#!/usr/bin/env ruby

require_relative 'common'

def count_stdin(input)
  three_word_combinations = {}

  # Iterate through input streams and get three word combinations
  # input.each { |stream|
  input.each_line.lazy.each { |stream|
    words = words_from_string(stream)
    parsed_phrases = phrases(words, 3)

    parsed_phrases.each { |phrase|
      # Update variable to add to sum total or set initially to 1
      if three_word_combinations.include?(phrase)
        three_word_combinations[phrase] += 1
      else
        three_word_combinations[phrase] = 1
      end
    }
  }

  # Sort phrase combinations and totals descending, show only first 100
  three_word_combinations.sort {|a1, a2| a2[1] <=> a1[1] }.first(100).each { |phrase, total|
    puts "#{total} - #{phrase}"
  }
end

# ---- input ---
input = ARGF.read
count_stdin(input)
