require_relative('../db/SqlRunner')


class Owner

  attr_reader :id 
  attr_accessor :full_name, :species_desired, :adopt_status, :extra_details

  def initialize (options)
    @full_name = options['full_name']
    @id = nil || options['id'].to_i
    @species_desired = options['species_desired']
    @adopt_status = checkAdoptStatus(options['adopt_status'])
    @extra_details = options['extra_details']
  end

  def save ()
        sql = "INSERT INTO owners (full_name, species_desired, adopt_status, extra_details) VALUES ('#{@full_name}','#{@species_desired}', '#{@adopt_status}', '#{@extra_details}') RETURNING id;"
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
        adopt_status = ' #{options['adopt_status']}',
        extra_details = '#{options['extra_details']}'
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
      
      def checkAdoptStatus(status)

       return  status == 'true' || status == true
      end

      def adopt_status_text()
        if @adopt_status == true
          return "Has adopted." 
        end
        return " #{@full_name} is waiting to adopt."
      end
end