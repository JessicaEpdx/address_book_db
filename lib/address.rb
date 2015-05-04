
class Address
  attr_reader(:number, :street, :city, :state)

  define_method(:initialize) do |attributes|
    @number = attributes.fetch(:number)
    @street = attributes.fetch(:street)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
  end

  define_method(:save) do
    @@addresses.push(self)
  end

  define_singleton_method(:clear) do
    @@addresses = []
  end

  define_singleton_method(:all) do
    @@addresses
  end
end
