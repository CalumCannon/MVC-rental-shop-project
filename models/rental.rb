class Rental

      attr_reader :name, :age, :id

      def initialize( options )
        @id = options['id'].to_i if options['id']
        @customer_id = options['customer_id'].to_i
        @stock_id = options['stock_id'].to_i
        @rent_date = options['rent_date']
      end

      def save
        sql = "INSERT INTO rentals (customer_id, stock_id, rent_date) VALUES ($1,$2, $3) RETURNING id"
        values = [@customer_id, @stock_id, @rent_date]
        result = SqlRunner.run(sql, values).first()
        @id = result["id"].to_i
      end

      def delete
        sql = "DELETE FROM rentals WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql,values)
      end

      def update
          sql = "UPDATE rentals SET (customer_id, stock_id, rent_date) = ($1,$2,$3) WHERE id = $4"
          values = [@customer_id, @stock_id, @rent_date, @id]
          SqlRunner.run(sql,values)
      end

      def self.all
        sql = "SELECT * FROM rentals"
        values = SqlRunner.run(sql)
        return values.map{|rental| Rental.new(rental)}
      end

end
