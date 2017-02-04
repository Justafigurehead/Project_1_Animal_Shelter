require_relative ('../db/Sqlrunner')

class Animal
 
  def initialize (options)
    @animal_name = options["animal_name"]
    @adoption_status = options["adoption_status"]
    @admission_date = options["admission_date"]
    @species = options["species"]
    @breed = options["breed"]
    @id = nil || options["id"].to_i
  end
 
    def save ()
      sql = "INSERT INTO animals (animal_name, adoption_status, admission_date, species, breed) VALUES ('#{@animal_name}', '#{@adoption_status}', '#{@admission_date}', '#{@species}', '#{@breed}') RETURNING id;"
      result = SqlRunner.run(sql).first
      @id = result['id'].to_i
    end
 
    def self.all()
      sql = "SELECT * FROM animals;"
      result = SqlRunner.run( sql )
      return result.map { |options| Animal.new(options) }
    end

    def self.update(options) 
      sql = "UPDATE animals SET 
      animal_name = '#{options['animal_name']}',
      adoption_status = '#{options['adoption_status']}',
      admission_date = '#{options['admission_date']}',
      species = '#{options['species']}',
      breed = '#{options['breed']}'
      WHERE id = #{options['id']};"

      SqlRunner.run(sql)
    end

    def self.find(id) 
      sql = "SELECT * FROM animals WHERE id = #{id};"
      animal = SqlRunner.run(sql)
      result = Animal.new(animal.first)
      return result
    end

    def self.delete(id)
      sql = "DELETE FROM animals where id = #{id};"
      SqlRunner.run( sql )
    end

end