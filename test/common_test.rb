require_relative 'test_helper'

require_relative '../common'


class TestCommon < Minitest::Test
  def test_words_from_string
    input_string = 'this is an !@! UNFORMATTED string @'
    expected_words = ['this', 'is', 'an', 'unformatted', 'string']
    assert_equal expected_words, words_from_string(input_string)
  end

  def test_phrases
    words = ['one', 'two', 'three', 'four', 'five']
    parsed_phrases = phrases(words, 2)
    assert_equal ['one two', 'two three', 'three four', 'four five'], parsed_phrases.to_a
  end

  def test_count_stdin
    stream = IO.read(File.join(BASE_DIR, 'test/origin-of-species.txt'))
    actual = count_stdin(stream).last(1)
    expected = [["of the same", 277]]
    assert_equal actual, expected
  end
end
