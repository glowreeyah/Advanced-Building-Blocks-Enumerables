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

  def my_all?(args = nil)
    result = true
    my_each do |value|
      if block_given?
        result = false unless yield(value)
      elsif args.nil?
        result = false unless value
      else
        result = false unless args === value
      end
    end
    result
  end

  def my_any?(args = nil)
    result = false
    my_each do |value|
      if block_given?
        result = true if yield(value)
      elsif args.nil?
        result = true if value
      else
        result = true if args === value
      end
    end
    result
  end

  def my_none?(args = nil)
    result = true
    my_each do |value|
      if block_given?
        result = false if yield(value)
      elsif args.nil?
        result = false if value
      else
        result = false if args === value
      end
    end
    result
  end

  def my_count(args = nil)
    count = 0
    my_each do |item|
      if block_given?
        count += 1 if yield(item)
      elsif args
        count += 1 if item == args
      else
        count = length
      end
    end
    count
  end

  def my_map(args = nil)
    
  end
end