class Stock
  attr_reader :image, :id
  attr_accessor :name, :price, :amount, :type

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @amount = options['amount'].to_i
    @price = options['price'].to_i
    @image = options['image']
    @type = options['type']
  end

  def save
    sql = "INSERT INTO stocks (name, amount, price, image, type) VALUES ($1,$2, $3, $4, $5) RETURNING id"
    values = [@name, @amount, @price, @image, @type]
    result = SqlRunner.run(sql, values).first()
    @id = result["id"].to_i
  end

  def delete
    sql = "DELETE FROM stocks WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def update
      sql = "UPDATE stocks SET (name, amount, price, image, type) = ($1,$2,$3,$4, $5) WHERE id = $6"
      values = [@name, @amount, @price, @image, @id, @type]
      SqlRunner.run(sql,values)
  end

   def self.all
     sql = "SELECT * FROM stocks"
     values = SqlRunner.run(sql)
     return values.map{|stock| Stock.new(stock)}
   end

   def self.find_by_id(id)
     sql = "SELECT * FROM stocks WHERE id = $1"
     values = [id]
     return Stock.new(SqlRunner.run(sql,values).first())
   end

   def check_out_stock

     if(@amount - 1 > 0)

       @amount -= 1
       update()
       return true

     end
     return false

   end

   def self.search(search)
     sql = "SELECT * FROM stocks WHERE name LIKE $1"
     values = ["%#{search}%"]
     result = SqlRunner.run(sql,values)
     return result.map{|stock|Stock.new(stock)}
   end

end
