require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/Owner')


get '/owners' do
  @owners = Owner.all()
  erb (:"/owners/index")
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
  @owner = Owner.find(params[:id])
  erb(:"/owners/show")
end

# edit owner
get '/owners/:id/edit' do
    @owners = Owner.find(params[:id])
    erb(:"/owners/edit")
end

#post edit
post '/owners/:id' do
      
  @owners = Owner.update(params)
  redirect to ("/owners/#{params[:id]}")
end

#delete 
post '/owners/:id/delete' do
  Owner.delete(params[:id])
  redirect to ("/owners")
end