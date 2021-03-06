# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'
require 'net/http'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
api_key_sid = 'SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
api_key_secret = 'your_api_key_secret'

client = Twilio::REST::Client.new(api_key_sid, api_key_secret)

room_sid = 'RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
recording_sid = 'RTXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
uri = 'https://video.twilio.com/v1/' +
      "Rooms/#{room_sid}/" +
      "Recordings/#{recording_sid}/" +
      'Media'
response = client.request('video.twilio.com', 443, 'GET', uri)
media_location = response.body['redirect_to']

media_content = Net::HTTP.get(URI(media_location))
puts media_content
