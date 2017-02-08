require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/Animal')

# Show all animals
get '/animals' do
  @animals = Animal.all()
  erb (:"/animals/index")
end

#show form to create new animal
get "/animals/new" do
  @animals = Animal.all()
  erb(:"/animals/new")
end

#post new animal form
post "/animals" do
  @animal = Animal.new(params)
  @animal.save()
  redirect to ("/animals/#{@animal.id}")
end

get "/animals/order" do
  @animals = Animal.order_by_admission_date()
  erb (:"/animals/index")
  end
 
  get "/animals/order_species" do
    @animals = Animal.order_by_species()
    erb (:"/animals/index")
  end

  get "/animals/cats" do
    @animals = Animal.cats
    erb(:"/animals/cats")
  end

  get "/animals/dogs" do
    @animals = Animal.dogs
    erb(:"/animals/dogs")
  end

  get "/animals/order_adopt_status" do
    @animals = Animal.order_adopt_status()
    erb(:"/animals/adoptable")
  end

#show animal by id
get "/animals/:id" do
     @animal = Animal.find(params[:id])
     erb(:"/animals/show")
end

#show form to edit new animal
get "/animals/:id/edit" do
  @animal = Animal.find(params[:id])
  erb(:"/animals/edit")
end

#submit edited form.
post "/animals/:id" do
      @animal = Animal.update(params)
      redirect to ("/animals/#{params[:id]}")
end

#delete animal
post "/animals/:id/delete" do
  Animal.delete(params[:id])
  redirect to ("/animals")
end

