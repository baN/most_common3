BASE_DIR = File.expand_path(__dir__).freeze


# Parses CLI args and returns open streams based on those args
def argv_streams
  ARGV.map {|arg| File.open(File.join(BASE_DIR, arg))}
end

# Parses words from a given string and returns an array of words
def words_from_string(string)
  string.downcase.gsub(/[^a-z\-0-9_\s]/, '').split(' ')
end

# Returns words array from a stream like File, or STDIN
def words_from_stream(stream)
  # adding lazy to prevent entire file from being processed
  # research from: https://blog.honeybadger.io/using-lazy-enumerators-to-work-with-large-files-in-ruby/
  stream.each_line.lazy.each.map do |line|
    words_from_string(line)
  end.to_a.flatten # flatten array of word arrays
end

# Returns phrase combinations given words and length of words in a phrase
def phrases(words, length)
  words.lazy.each_with_index.map {|_, index|
    phrase = ''
    eof = false

    length.times do |i|
      word = words[index+i]

      # Reached end, break out
      if word.nil?
        eof = true
      else
        phrase += "#{words[index+i]} "
      end
    end

    if eof
      next # sets value to nil if not a three word combo
    end

    phrase.rstrip
  }.reject(&:nil?) # remove any nil values
end