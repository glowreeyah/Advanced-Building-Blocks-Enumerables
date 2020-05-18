# rubocop: disable Metrics/ModuleLength, Metrics/MethodLength, Style/CaseEquality, Style/IfInsideElse

module Enumerable
  def my_each
    return to_enum unless block_given?

    n = 0
    while n <= size - 1
      yield(to_a[n])
      n += 1
    end
  end

  def my_each_with_index
    return to_enum unless block_given?
      
    n = 0
    while n <= size - 1
      yield(to_a[n], n)
      n += 1
    end
  end

  def my_select
    return to_enum unless block_given?
      
    result_arr = []
    my_each do |item|
      result_arr.push(item) if yield(item)
    end
    result_arr
  end
end