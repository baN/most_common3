require_relative 'test_helper'

require_relative '../common'


class TestCommonBenchmark < Minitest::Benchmark
  def bench_count_stdin
    stream = IO.read(File.join(BASE_DIR, 'test/origin-of-species.txt'))
    counted = count_stdin(stream)

    assert_performance_constant do |n|
      counted[n]
    end
  end
end
