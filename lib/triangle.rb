require 'pry'

class Triangle
  attr_reader :length_one, :length_two, :length_three
  attr_accessor :equilateral, :isoceles, :scalene

  def initialize (length_one, length_two, length_three)
    @length_one = length_one
    @length_two = length_two
    @length_three = length_three
  end

  def kind
    sum = length_one + length_two + length_three
    arr = [length_one, length_two, length_three].sort
    if sum <= 0 || arr[0] < 0 || arr[0] + arr[1] <= arr[2]
        raise TriangleError
    elsif length_one == length_two && length_two == length_three
      :equilateral
    elsif length_one != length_two && length_two != length_three && length_one != length_three
      :scalene
    else
      :isosceles
    end
  end

  class TriangleError < StandardError
  end
end