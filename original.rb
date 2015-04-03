def stringify(matrix)
  matrix
      .reduce('') do |result, a| # 文字列に畳み込む
    result << a.map(&:to_s) .map { |v| v.rjust(4) } .join('|')
    result << "\n" # 改行して区切る
  end
end

def calcurate(matrix)
  matrix
  .map { |a| a << a.inject(:+) }     # -> [[1,3,5,9], [2,4,6,12]]
       .transpose
  .map { |a| a << a.inject(:+) }     # -> [[1,2,3], [3,4,7], [5,6,11], [9,12,21]]
       .transpose # 計算が終わったので、行と列を元に戻す
end

def make_matrix(width: 4, height: 4)
  # 要素は全部でwidth * height分ある
  [*1..(width * height)]
  .fill { Random.rand(99) }
  .each_slice(height)
  .to_a
end

matrix = make_matrix(width: 5, height: 4)
calcurated = calcurate(matrix)
puts stringify(calcurated)