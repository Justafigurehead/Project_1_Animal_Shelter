require_relative('../db/SqlRunner')


class Owner

  attr_reader :id 

  def initialize (options)
    @full_name = options['full_name']
    @id = nil || options['id'].to_i
    @species_desired = options['species_desired']
  end

  def save ()
        sql = "INSERT INTO owners (full_name, species_desired) VALUES ('#{@full_name}','#{@species_desired}') RETURNING id;"
        result = SqlRunner.run(sql).first
        @id = result['id'].to_i
      end
   
      def self.all()
        sql = "SELECT * FROM owners;"
        result = SqlRunner.run( sql )
        return result.map { |options| Owner.new(options) }
      end

      def self.update(options) 
        sql = "UPDATE owners SET full_name = '#{options['full_name']}', 
        species_desired = '#{options['species_desired']}'
        WHERE id = #{options['id']};"

        SqlRunner.run(sql)
      end

      def self.find(id) 
        sql = "SELECT * FROM owners WHERE id = #{id};"
        owner = SqlRunner.run(sql)
        result = Owner.new(owner.first)
        return result
      end

      def self.delete(id)
        sql = "DELETE FROM owners where id = #{id};"
        SqlRunner.run( sql )
      end

end