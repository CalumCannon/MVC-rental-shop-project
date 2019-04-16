require_relative('../db/sql_runner.rb')
require_relative('../models/rental.rb')

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

    def self.all
      sql = "SELECT * FROM customers"
      values = SqlRunner.run(sql)
      return values.map{|customer| Customer.new(customer)}
    end

    def self.find_by_id(id)
      sql = "SELECT * FROM customers WHERE id = $1"
      values = [id]
      result = SqlRunner.run(sql,values).first()
      return Customer.new(result)
    end

    def rentals
      sql = "SELECT * FROM stocks INNER JOIN rentals ON rentals.customer_id = stocks.id WHERE rentals.customer_id = $1"
      values = [@id]
      results = SqlRunner.run(sql, values)
      return results.map{|rental| Rental.new(rental)}
    end

    def self.search(search)
      sql = "SELECT * FROM customers WHERE name LIKE $1"
      values = ["%#{search}%"]
      result = SqlRunner.run(sql,values)
      return result.map{|customer|Customer.new(customer)}
    end

end
