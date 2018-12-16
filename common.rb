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
