class Repository
  
  attr_accessor :url, :private, :owner, :name
  
  def initialize(attributes)
    @name = attributes[:name]
    @url = attributes[:url]
    @private = attributes[:private]
    @owner = Author.new(attributes[:owner])
  end
  
end