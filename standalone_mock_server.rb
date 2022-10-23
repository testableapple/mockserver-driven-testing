require 'json'
require 'sinatra'

users = ''

get '/api/v2/users' do
  users
end

post '/mock/user' do
  request_body = JSON.parse(request.body.read)
  response = File.read('TestMockServer/NativeMockServerUITests/users.json')
  response_json = JSON.parse(response)
  response_json['first_name'] = request_body['username']
  users = JSON.generate(response_json)
end
