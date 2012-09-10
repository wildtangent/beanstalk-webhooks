require 'test_helper'

# Super simple test for now just to save writing it by hand 
# Be aware that this DOES actually send the message to Pivotal (no mocked API response) so be sure to delete the comments it creates
class CommitsControllerTest < ActionController::TestCase
  
  test "it should send a commit message" do
    body = '{"payload":{"repository":{"url":"http://livestation.beanstalkapp.com/livestation-git","private":"true","owner":{"email":"joe.connor@livestation.com","name":"Joe Connor"},"name":"livestation-git"},"uri":"git@livestation.beanstalkapp.com:/livestation-git.git","branch":"master","pusher_id":"120368","after":"1111111111111111111111111111111111111111","before":"0000000000000000000000000000000000000000","pusher_name":"Joe Connor","commits":[{"timestamp":"2012-09-06T08:54:05+00:00","message":"[#35579411] Fake commit message","url":"http://livestation.beanstalkapp.com/livestation-git/changesets/1111111111111111111111111111111111111111","id":"1111111111111111111111111111111111111111","author":{"email":"john.jones@gmail.com","name":"Mr Jones"}}],"ref":"refs/heads/master"}}'
    json = JSON.parse(body).with_indifferent_access
    payload = Payload.new(json[:payload])
    result = payload.save!
    assert((result == [true]), "Saving the payload should return an array of true/false objects #{result}")
  end
  
end
