require 'net/http'
require 'uri'

class PivotalTracker::ApiRequest
  
  # Set some defaults
  @@token = configatron.api_request.token
  @@host = "http://www.pivotaltracker.com"
  @@method = "POST"
  @@path = "/services/v3/source_commits"
  @@content_type = "application/xml"
  
  cattr_accessor :token
  
  attr_accessor :body
  
  # Initialize with body payload
  def initialize(body)
    @body = body
  end
  
  # Construct and send the API request
  def send!
    request = Net::HTTP::Post.new(uri.path, headers)
    request.body = @body
    request.content_type = @@content_type
    response = Net::HTTP.start(uri.host, uri.port) do |http|
      http.request(request)
    end
    ok?(response)
  end
  
  # Construct URI object
  def uri
    URI.parse("#{@@host}#{@@path}")
  end
  
  # Construct headers
  def headers
    headers = {
      "X-TrackerToken" => @@token
    }
  end
  
  # Was the response successful
  def ok?(response)
    case response
    when Net::HTTPSuccess
      true
    else
      false
    end
  end
  
end