require 'minitest/autorun'

module SumMatrix
  extend self

  def generate_sum_matrix(col: 4, row: 4, number_range: 1..1000)
    matrix = generate_matrix(col: col, row: row, number_range: number_range)
    format_matrix(sum_matrix(matrix))
  end

  def sum_matrix(matrix)
    matrix
        .map{|row| [*row, row.inject(:+)] }
        .transpose
        .map{|row| [*row, row.inject(:+)] }
        .transpose
  end

  def format_matrix(matrix)
    size = matrix.flatten.max.to_s.length
    matrix.map{|row| format_row(row, size) }.join("\n")
  end

  def format_row(row, size)
    row.map{|col| col.to_s.rjust(size) }.join('|')
  end

  def generate_matrix(col: 4, row: 4, number_range: 1..1000)
    row.times.map{ number_range.to_a.sample(col) }
  end
end

class TestSumMatrix < Minitest::Test
  def test_sum_matrix
    input = [
        [9, 85, 92, 20],
        [68, 25, 80, 55],
        [43, 96, 71, 73],
        [43, 19, 20, 87],
        [95, 66, 73, 62]
    ]
    expected = [
        [9, 85, 92, 20, 206],
        [68, 25, 80, 55, 228],
        [43, 96, 71, 73, 283],
        [43, 19, 20, 87, 169],
        [95, 66, 73, 62, 296],
        [258, 291, 336, 297, 1182]
    ]

    assert_equal expected, SumMatrix.sum_matrix(input)
  end

  def test_format_matrix_max_400
    input = [
        [1, 2, 3, 4],
        [100, 200, 300, 400]
    ]
    expected = <<-TEXT.chomp
  1|  2|  3|  4
100|200|300|400
    TEXT

    assert_equal expected, SumMatrix.format_matrix(input)
  end

  def test_format_matrix_max_40
    input = [
        [1, 2, 3, 4],
        [10, 20, 30, 40]
    ]
    expected = <<-TEXT.chomp
 1| 2| 3| 4
10|20|30|40
    TEXT

    assert_equal expected, SumMatrix.format_matrix(input)
  end

  def test_generate_matrix
    matrix = SumMatrix.generate_matrix(col: 4, row: 5, number_range: 1..9999)
    assert_equal 5, matrix.size
    assert matrix.all?{|row| row.size == 4 }
    assert matrix.all?{|row| row.all?{|n| (1..9999).include?(n) } }
  end

  # テストしたいというよりも結果が見たいだけ
  def test_generate_sum_matrix
    result = SumMatrix.generate_sum_matrix
    puts result
    assert result.is_a?(String)
  end
end