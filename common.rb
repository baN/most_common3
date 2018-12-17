BASE_DIR = File.expand_path(__dir__).freeze

# Takes a string and returns an array of words
def words_from_string(string)
  string.downcase.gsub(/[^a-z\-0-9_\s]/, '').split(' ') #ignores punctuation, line endings, and is case insensitive
end

# Returns 3 words per line in an array
def phrases(words, length)
  words.lazy.each_with_index.map {|_, index|
    phrase = ''
    eof = false

    length.times do |i| #creates 3 word combos, traversing each index.
      word = words[index+i]

      # Reached end, break out
      if word.nil?
        eof = true
      else
        phrase += "#{words[index+i]} "
      end
    end #end length loop

    if eof
      next # sets value to nil if not a three word combo
    end

    phrase.rstrip #remove whitespace
  }.reject(&:nil?) # remove any nil values
end

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
  sorted = three_word_combinations.sort_by{ |combo| combo[1]}.last(100) #sort_by better for large collections
  return sorted
end
