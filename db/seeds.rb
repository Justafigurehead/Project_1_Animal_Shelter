require('pry-byebug')
require_relative('../models/Animal')
require_relative('../models/Owner')
require_relative('../models/Adoption')


animal_1 = Animal.new({
  "animal_name" => "Oreo",
  "adoption_status" => "Not adoptable",
  "admission_date" => "2017-02-01",
  "species" => "cat",
  "ready_by_date" => "2017-04-22",
  "details" => "...",
  "animal_pic"  => "/imgs/oreo_pic.jpg"
})

animal_2 = Animal.new({
  "animal_name" => "Ulrich",
  "adoption_status" => "Ready",
  "admission_date" => "2017-02-10",
  "species" => "dog",
  "ready_by_date" => "2017-05-22",
  "details" => "...",
  "animal_pic" =>"/imgs/ulrich_pic.jpg"
})

animal_3 = Animal.new({
  "animal_name" => "Max",
  "adoption_status" => "Ready",
  "admission_date" => "2017-02-10",
  "species" => "dog",
  "ready_by_date" => "2017-05-22",
  "details" => "...",
  "animal_pic" =>"/imgs/max_pic.jpg"
})

animal_1.save
animal_2.save
animal_3.save


owner_1 = Owner.new({
  "full_name" => "Michaela Strachan",
  "species_desired" => "cat", 
  "adopt_status" => true,
  "extra_details" => "Extra info here."
  })

owner_2 = Owner.new({
  "full_name" => "Jamie Pilc",
  "species_desired" => "dog",
  "adopt_status" => false, 
  "extra_details" => "Extra info here."
  })

owner_1.save
owner_2.save

adoption_1 = Adoption.new({
  "owner_id" => "1",
  "animal_id" => "1"
  })

adoption_1.save

pry.binding
nil