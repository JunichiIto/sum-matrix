require "minitest/autorun"

class TestMeme < Minitest::Test
  def sum_matrix(matrix)
    matrix
        .map{|row| [*row, row.inject(:+)] }
        .transpose
        .map{|row| [*row, row.inject(:+)] }
        .transpose
  end

  def test_hoge
    input = [
        [9,85,92,20],
        [68,25,80,55],
        [43,96,71,73],
        [43,19,20,87],
        [95,66,73,62]
    ]
    expected = [
        [9,85,92,20,206],
        [68,25,80,55,228],
        [43,96,71,73,283],
        [43,19,20,87,169],
        [95,66,73,62,296],
        [258,291,336,297,1182]
    ]

    assert_equal expected, sum_matrix(input)
  end
end