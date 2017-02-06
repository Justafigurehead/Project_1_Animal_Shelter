require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('controllers/adoption_controller.rb')
require_relative('controllers/animal_controller.rb')
require_relative('controllers/owner_controller.rb')

get '/' do
  erb( :index )
end