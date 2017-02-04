

attr_reader :id 

class Owner

  def initalize (options)
    @full_name = options['full_name']
    @id = nil || options['id'].to_i
    @prefence = options['species_desired']
  end


end