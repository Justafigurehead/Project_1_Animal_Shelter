require_relative('../db/Sqlrunner')

class Adoption

attr_reader :id 
attr_accessor :owner_id, :animal_id

  def initialize (options)
    @owner_id = options['owner_id'].to_i
    @animal_id = options['animal_id'].to_i
    @id = nil || options['id'].to_i
  end

  def save()
    sql = "INSERT INTO adoptions (owner_id, animal_id) VALUES (#{@owner_id}, #{@animal_id}) RETURNING id;"
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM adoptions;"
    result = SqlRunner.run(sql)
    return result.map{|adoption| Adoption.new(adoption)}
  end

# FIX THIS 
  def self.update(options)
    sql = "UPDATE adoptions SET owner_id = #{options['owner_id']}, animal_id = #{options['animal_id']};"
    SqlRunner.run(sql)
  end

  def self.find (id)
    sql = "SELECT * FROM adoptions WHERE id = #{id};"
    adoptions = SqlRunner.run(sql)
    result = Adoption.new(adoptions.first)
    return result
  end

  def self.delete(id)
    sql ="DELETE FROM adoptions where id = #{id};"
    SqlRunner.run(sql)
  end

  # def self.delete_all()
  #   sql = "DELETE FROM adoptions;"
  #   SqlRunner.run(sql)
  # end

  # INNER JOIN FUNCTIONS

    def animal()
      sql  = "SELECT * FROM animals a 
              INNER JOIN adoptions adopt
              ON adopt.animal_id = a.id 
              WHERE a.id = #{@animal_id};"
      result = SqlRunner.run(sql)
      return Animal.new(result.first)
    end

    def owner()
      sql =  "SELECT * FROM owners
              INNER JOIN adoptions adopt
              ON adopt.owner_id = owners.id
              WHERE owners.id = #{@owner_id};"
    result = SqlRunner.run(sql)
    return Owner.new(result.first)
    end

end