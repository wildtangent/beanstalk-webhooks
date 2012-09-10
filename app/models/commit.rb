class Commit
  
  attr_accessor :id, :timestamp, :message, :url
  
  # Initialize the commit object
  def initialize(attributes)
    @id = attributes[:id]
    @timestamp = DateTime.parse(attributes[:timestamp])
    @message = attributes[:message]
    @author = Author.new(attributes[:author])
  end
  
  # Convert to XML for PivotalTracker (TODO: move into serialization class if we need other types of commit XML)
  def to_xml
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.source_commit {
        xml.commit_id(@id)
        xml.url(@url)
        xml.author(@author.name)
        xml.message(@message)
      }
    end
    builder.to_xml
  end
  
  def save!
    xml = self.to_xml
    PivotalTracker::ApiRequest.new(xml).send!
  end
  
end