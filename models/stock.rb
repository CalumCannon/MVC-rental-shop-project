class Stock
  attr_reader :name, :amount, :age_rating, :image, :id
  attr_accessor :name

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @amount = options['amount'].to_i
    @age_rating = options['age_rating'].to_i
    @image = options['image']
  end

  def save
    sql = "INSERT INTO stocks (name, amount, age_rating, image) VALUES ($1,$2, $3, $4) RETURNING id"
    values = [@name, @amount, @age_rating, @image]
    result = SqlRunner.run(sql, values).first()
    @id = result["id"].to_i
  end

  def delete
    sql = "DELETE FROM stocks WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def update
      sql = "UPDATE stocks SET (name, amount, age_rating, image) = ($1,$2,$3,$4) WHERE id = $5"
      values = [@name, @amount, @age_rating, @image, @id]
      SqlRunner.run(sql,values)
  end

   def self.all
     sql = "SELECT * FROM stocks"
     SqlRunner.run(sql)
   end

   

end
