require_relative('../models/customer.rb')
require_relative('../models/rental.rb')
require_relative('../models/stock.rb')
require('pry-byebug')

customer1 = Customer.new({
'name' => 'Jim Raynor',
'age' => 35,
})

customer1.save()
# customer1.delete()
customer1.name = "NEW NAME"
customer1.update()

stock1 = Stock.new({
'name' => 'item1',
'amount' => 100,
'age_rating' => 12,
'image' => 'IMAGE-URL'
})
stock1.save()
stock1.name = "NEW STOCK"
stock1.update();

rental1 = Rental.new({
'customer_id' => customer1.id,
'stock_id' => stock1.id,
'rent_date' => '12/04/19'
})
rental1.save()
# rental1.delete()
