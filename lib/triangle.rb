class Triangle
  attr_accessor :side_1, :side_2, :side_3

  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
  end

  def kind
    triangle?
    if equilateral?
      return :equilateral
    elsif scalene?
      return :scalene
    elsif isosceles?
      return :isosceles
    end
  end

  def isosceles?
    #check if any two sides are equal 
    if @side_1 == @side_2 || @side_1 == @side_3 || @side_2 == @side_3 && !equilateral?
      return true
    else
      return false
    end
  end

  def equilateral?
    if @side_1 == @side_2 && side_2 == side_3
      return true
    else
      return false
    end
  end

  def scalene?
    #check that none of the sides are equal
    if @side_1 != @side_2 && @side_1 != @side_3 && @side_2 != @side_3 
      return true
    else
      return false
    end
  end

  def triangle?
    if has_sides? && triangle_inequality?
      true
    else
      raise TriangleError
    end
  end

  def has_sides?
    @side_1 > 0 && @side_2 > 0 && @side_3 > 0
  end

  def triangle_inequality?
    @side_1 + @side_2 > @side_3 && @side_1 + @side_3 > @side_2 && @side_3 + @side_2 > @side_1
  end

  class TriangleError < StandardError
      "given measurements do not create a triangle"
  end

end
