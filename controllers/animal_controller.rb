require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/Animal')


get '/animals' do

  @animals = Animal.all()
  erb (:"animals/all")

end