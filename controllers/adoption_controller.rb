require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/Adoption')


#Show all animals

get '/adoptions' do
  @adoptions = Adoption.all()
  erb (:"/adoption/index")
end
 
#show form to create new animal
get '/adoptions/new' do
  @owners = Owner.all()
  @animals = Animal.all()
  erb(:"/adoption/new")
end

#post new animal form
post '/adoptions' do
  @adoption = Adoption.new(params)
  @adoption.save()
  redirect to ("/adoptions/#{@adoption.id}")
end

#show animal by id
get '/adoptions/:id' do 
  @adoption = Adoption.find(params['id'])
  erb(:"/adoption/show")
end

# get '/adoptions/:id/edit' do
#   @adoption = Adoption.find(params[:id])
#   erb(:"/adoption/edit")
# end

# post '/adoptions/:id' do 
#   @adoption = Adoption.update(params)
#   redirect to ("/adoptions/#{params[:id]}")
# end