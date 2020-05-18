module Enumerable
  def my_each
    return to_enum unless block_given?

    n = 0
    while n <= size - 1
      yield(to_a[n])
      n += 1
    end
  end
end