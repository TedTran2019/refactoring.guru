# Abstract Factory: Interface that declares methods that return different abstract products (family)
# Products of one variant are incompatible with products of another variant.
class FurnitureFactory # This is the AbstractFactory
  # @abstract
  def create_chair
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  # @abstract
  def create_table
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end


# Concrete Factory: produce a family of products that belong a single variant
class ModernFurnitureFactory < FurnitureFactory # This is the ConcreteFactory inheriting from the AbstractFactory
  def create_chair
    ModernChair.new
  end

  def create_table
    ModernTable.new
  end
end

class VictorianFurnitureFactory < FurnitureFactory # This is the ConcreteFactory inheriting from the AbstractFactory
  def create_chair
    VictorianChair.new
  end

  def create_table
    VictorianTable.new
  end
end

# Each distinct product of a product family should have a base interface.
class Chair # This is the AbstractProduct
  # @abstract
  #
  # @return [String]
  def sit
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Concrete Products are created by corresponding Concrete Factories.
class ModernChair < Chair # This is the ConcreteProduct
  def sit
    'Sitting on a modern chair!'
  end
end

class VictorianChair < Chair # This is another ConcreteProduct
  def sit
    'Sitting on a Victorian chair!'
  end
end

# Proper interaction is possible only between products of the same concrete variant.
class Table # This is another AbstractProduct
  def display
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  # Collaborating with Chair
  def join_with(_chair)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ModernTable < Table
  # @return [String]
  def display
    "Displaying on a modern table"
  end

  def join_with(chair)
    result = chair.sit
    "The result of the modern table collaborating with the (#{result})"
  end
end

class VictorianTable < Table
  # @return [String]
  def display
    'Displaying on a Victorian table'
  end

  def join_with(chair)
    result = chair.sit
    "The result of the Victorian Table collaborating with the (#{result})"
  end
end

# Client only sees factory, chair, and table
# Programmer can pass in any factory/product
def client_code(factory)
  chair = factory.create_chair
  table = factory.create_table

  puts table.display
  puts table.join_with(chair)
end

# The client code can work with any concrete factory class.
puts 'Client: Testing client code with the first factory type:'
client_code(ModernFurnitureFactory.new)

puts "\n"

puts 'Client: Testing the same client code with the second factory type:'
client_code(VictorianFurnitureFactory.new)
