require_relative('../db/Sqlrunner')

class Adoption

  def initialize (options)
    @owner_id = options['owner_id'].to_i
    @animal_id = options['animal_id'].to_i
    @id = nil || options['id'].to_i
  end

  def save()
    sql = "INSERT INTO adoptions (owner_id, animal_id) VALUES ('#{@owner_id}', '#{@animal_id}') RETURNING id;"
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM adoptions;"
    result = SqlRunner.run(sql)
    return result.map{|adoption| Adoption.new(adoption)}
  end

end