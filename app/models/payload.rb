class Payload
  
  attr_accessor :repository, :uri, :branch, :ref, :pusher_id, :pusher_name, :commits, :after, :before, :attributes
  
  # Initialize the payload objects and associations
  def initialize(attributes)
    attributes  = from_json(attributes)
    @attributes = attributes
    @repository = Repository.new(attributes[:repository])
    @uri = attributes[:uri]
    @branch = attributes[:branch]
    @pusher_id = attributes[:pusher_id]
    @after = attributes[:after]
    @before = attributes[:before]
    @pusher_name = attributes[:pusher_name]
    @ref = attributes[:ref]
    @commits = attributes[:commits].collect{|commit| Commit.new(commit)}
  end
  
  # Save the individual commits, and return an array of true,false for each commit.
  def save!
    @commits.collect do |commit|
      commit.save!
    end
  end
  
  # Parse the JSON object since Rails doesn't want to do it for us
  def from_json(attributes)
    JSON.parse(attributes).with_indifferent_access
  end
  
end