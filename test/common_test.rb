require_relative 'test_helper'

require_relative '../common'


class TestCommon < Minitest::Test
  def test_argv_streams
    # from: https://stackoverflow.com/questions/48401427/test-cli-with-parameters
    pseudoIO = StringIO.new
    $stdout = pseudoIO

    ARGV.replace ['test/origin-of-species.txt', './test/origin-of-species.txt']

    streams = argv_streams
    expected_first_string = '﻿The Project Gutenberg EBook of On the Origin of Species, by Charles Darwin'

    streams.each do |stream|
      assert_equal expected_first_string, stream.first.rstrip
    end
  end

  def test_words_from_string
    input_string = 'this is an !@! UNFORMATTED string @'
    expected_words = ['this', 'is', 'an', 'unformatted', 'string']

    assert_equal expected_words, words_from_string(input_string)
  end

  def test_words_from_stream
    stream = File.open(File.join(BASE_DIR, 'test/origin-of-species.txt'))
    words = words_from_stream(stream)

    assert_equal 'of', words[4]
    assert_equal 'ebook', words[14]
  end

  def test_phrases
    words = ['one', 'two', 'three', 'four', 'five']
    parsed_phrases = phrases(words, 2)

    assert_equal ['one two', 'two three', 'three four', 'four five'], parsed_phrases.to_a
  end
end
