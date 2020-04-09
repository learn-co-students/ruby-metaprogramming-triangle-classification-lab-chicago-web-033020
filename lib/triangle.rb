require "pry"

class Triangle
  attr_accessor :length_one, :length_two, :length_three, :sides

  def initialize(length_one, length_two, length_three)
    @length_one = length_one
    @length_two = length_two
    @length_three = length_three
    @sides = []
    @sides << length_one << length_two << length_three
  end

  def side_equal_to_zero_checker
    # checks if any size is equal to 0.
    if self.length_one == 0 || self.length_two == 0 || self.length_three == 0
      return true
    end
  end

  def side_is_negative
    if self.length_one < 0 || self.length_two < 0 || self.length_three < 0
      return true
    end
  end

  def violating_triangle_inequality
    
    a = self.length_one
    b = self.length_two
    c = self.length_three

    if a + b <= c || a + c <= b || c + b <= a
      return true
    end
  end

  def equilateral_checker
    # checks if triangle is an equilateral
    self.sides.all? do |side|
      side == self.sides.first
    end
  end

  def isosceles_checker
    # checks if triangle is an equilateral
    if length_one == length_two || length_two == length_three || length_one == length_three
      return true
    end
  end

  def kind

    if self.side_equal_to_zero_checker == true || self.side_is_negative == true || self.violating_triangle_inequality == true
      raise TriangleError
    end

    if self.equilateral_checker == true
      return :equilateral
    elsif self.isosceles_checker == true
      return :isosceles
    else
      return :scalene
    end

  end

  class TriangleError < StandardError
    def message_zero_sides
      puts "Sides cannot be equal to 0!"
    end
  end
end

# binding.pry
