class Triangle
  
  attr_accessor :a, :b, :c, :array

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
    @array = [a, b, c]
  end

  def kind
    validate_triangle
    if array.uniq.length == 1
      :equilateral
    elsif array.uniq.length == 2
      :isosceles
    elsif array.uniq.length == 3
      p :scalene
    end
  end

  def validate_triangle
    if array.any? {|side| side <= 0}
      raise TriangleError
    elsif (a + b <= c) || (a + c <= b) || (b + c <= a)
      raise TriangleError
    end 
  end

  class TriangleError < StandardError
  end


end
