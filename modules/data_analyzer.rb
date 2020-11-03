module DataAnalyzer
  private
  # 平均
  def average(array)
    array.sum.to_f / array.size
  end

  # 分散
  def variance(array)
    average(array.map{ |i| i**2 }) - average(array) ** 2
  end

  # 共分散
  def covariance(array1, array2)
    expected_value = inner_product(array1, array2)/array1.size
    expected_value - average(array1) * average(array2)
  end

  # 内積
  def inner_product(array1, array2)
    ret = 0
    array1.size.times{ |i| ret += array1[i] * array2[i] }
    ret.to_f
  end

  # 最小２乗法
  def least_squares_method(array1, array2)
    slope = covariance(array1, array2) / variance(array1) # 傾き
    intercept = average(array2) - slope * average(array1) # 切片
    { slope: slope, intercept: intercept }
  end

  module_function :average, :variance, :covariance, :inner_product,
                  :least_squares_method
end
