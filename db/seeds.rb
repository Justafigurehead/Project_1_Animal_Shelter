require('pry-byebug')
require_relative('../models/Animal')


animal_1 = Animal.new({
  "animal_name" => "Oreo",
  "adoption_status" => "Not adoptable",
  "admission_date" => "2017-02-01",
  "species" => "cat",
  "breed" => "Mixed"
})

animal_2 = Animal.new({
  "animal_name" => "Ulrich",
  "adoption_status" => "Ready",
  "admission_date" => "2017-02-10",
  "species" => "dog",
  "breed" => "Shepsky"
})

animal_1.save
animal_2.save

pry.binding
nil