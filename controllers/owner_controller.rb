require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/Owner')


get '/owners' do
  @owners = Owner.all()
  erb (:"owners/index")
end

#start form for new owner...

get '/owners/new' do
  @owner = Owner.all()
  erb(:"/owners/new")
end

#post new form
post '/owners' do
  @owner = Owner.new(params)
  @owner.save()
  redirect to ("/owners/#{@owner.id}")
end
 
#show owner by id
get '/owners/:id' do
  @owner = Owner.find(params['id'])
  erb(:"owners/show")
end

