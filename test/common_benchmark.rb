require_relative 'test_helper'

require_relative '../common'


class TestCommonBenchmark < Minitest::Benchmark
  def bench_words_from_stream
    stream = File.open(File.join(BASE_DIR, 'test/origin-of-species.txt'))
    parsed_words = words_from_stream(stream)

    assert_performance_constant do |n| # n is a range value
      parsed_words[n]
    end
  end
end