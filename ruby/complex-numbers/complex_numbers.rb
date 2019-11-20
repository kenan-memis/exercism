class ComplexNumber
  attr_accessor :real, :imaginary

  def initialize(a, b)
    @real = a
    @imaginary = b
  end

  def +(y)
    ComplexNumber.new(real + y.real, imaginary + y.imaginary)
  end

  def -(y)
    ComplexNumber.new(real - y.real, imaginary - y.imaginary)
  end

  def *(y)
    new_real = real * y.real - imaginary * y.imaginary
    new_imaginary = imaginary * y.real + real * y.imaginary

    ComplexNumber.new(new_real, new_imaginary)
  end

  def /(y)
    new_real = ((real * y.real + imaginary * y.imaginary) / (y.real**2 + y.imaginary**2).to_f).round(2)
    new_imaginary = ((imaginary * y.real - real * y.imaginary) / (y.real**2 + y.imaginary**2).to_f).round(2)

    ComplexNumber.new(new_real, new_imaginary)
  end

  def abs
    Math.sqrt(real**2 + imaginary**2)
  end

  def conjugate
    ComplexNumber.new(real, -imaginary)
  end

  def exp
    new_real = Math.exp(real) * Math.cos(imaginary)
    new_imaginary = imaginary == Math::PI ? 0 : Math.sin(imaginary)
    
    ComplexNumber.new(new_real, new_imaginary)
  end

  def ==(y)
    real == y.real && imaginary == y.imaginary
  end
end
