require 'json'
require 'sinatra'

users = File.read('TestMockServer/NativeMockServerUITests/users.json')

get '/api/v2/users' do
  users
end

post '/mock/users' do
  response = JSON.parse(users)
  response['first_name'] = JSON.parse(request.body.read)['username']
  users = JSON.generate(response)
end
