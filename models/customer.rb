require_relative('../db/sql_runner.rb')

class Customer

  attr_reader :age, :id
  attr_accessor :name

    def initialize( options )
      @id = options['id'].to_i if options['id']
      @name = options['name']
      @age = options['age']
    end

    def save
      sql = "INSERT INTO customers (name, age) VALUES ($1,$2) RETURNING id"
      values = [@name, @age]
      result = SqlRunner.run(sql, values).first()
      @id = result["id"].to_i
    end

    def delete
      sql = "DELETE FROM customers WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql,values)
    end

    def update
        sql = "UPDATE customers SET (name, age) = ($1,$2) WHERE id = $3"
        values = [@name, @age, @id]
        SqlRunner.run(sql,values)
    end


end
