class Stock
  attr_reader :image, :id
  attr_accessor :name, :price, :amount

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @amount = options['amount'].to_i
    @price = options['price'].to_i
    @image = options['image']
  end

  def save
    sql = "INSERT INTO stocks (name, amount, price, image) VALUES ($1,$2, $3, $4) RETURNING id"
    values = [@name, @amount, @price, @image]
    result = SqlRunner.run(sql, values).first()
    @id = result["id"].to_i
  end

  def delete
    sql = "DELETE FROM stocks WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def update
      sql = "UPDATE stocks SET (name, amount, price, image) = ($1,$2,$3,$4) WHERE id = $5"
      values = [@name, @amount, @price, @image, @id]
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


end
