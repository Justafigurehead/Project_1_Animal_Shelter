require_relative ('../db/Sqlrunner')

class Animal
 
 attr_accessor :animal_name,:adoption_status, :admission_date, :species,:ready_by_date,:details,:animal_pic, :id

  def initialize (options)
    @animal_name = options["animal_name"]
    @adoption_status = options["adoption_status"]
    @admission_date = options["admission_date"]
    @species = options["species"]
    @ready_by_date = options["ready_by_date"]
    @details = options["details"]
    @animal_pic = options["animal_pic"]
    @id = nil || options["id"].to_i
  end
 
    def save ()
      sql = "INSERT INTO animals (animal_name, adoption_status, admission_date, species, ready_by_date, details, animal_pic) VALUES ('#{@animal_name}', '#{@adoption_status}', '#{@admission_date}', '#{@species}','#{@ready_by_date}','#{@details}', '#{animal_pic}') RETURNING id;"
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
      ready_by_date = '#{options['ready_by_date']}',
      details = '#{options['details']}',
      animal_pic = '#{options['animal_pic']}'
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


    # ORDER BY FUNCTIONS

      def order_by_admission_date()
        sql = "SELECT admission_date FROM animals ORDER BY admission_date ASC;"
        SqlRunner.run(sql)
      end

      def order_by_readybydate()
        sql = "SELECT ready_by_date FROM animals ORDER BY ready_by_date DESC"
      end

      # DATE DIFFERENCE FUNCTION
      def date_diff_by_days()
      sql = "SELECT DATE_PART('day', ready_by_date) - DATE_PART('day', admission_date) AS difference FROM animals WHERE id = #{@id};"
      result = SqlRunner.run(sql).first
      return result
    end

end