require_relative('../models/customer.rb')
require_relative('../models/rental.rb')
require_relative('../models/stock.rb')
require('pry-byebug')

customer1 = Customer.new({
'name' => 'Jim Raynor',
'age' => 35,
})
customer1.save()

customer2 = Customer.new({
'name' => 'John McClane',
'age' => 30,
})
customer2.save()

stock1 = Stock.new({
'name' => 'item1',
'amount' => 100,
'age_rating' => 12,
'image' => 'IMAGE-URL'
})
stock1.save()

stock2 = Stock.new({
'name' => 'item2',
'amount' => 100,
'age_rating' => 12,
'image' => 'IMAGE-URL'
})
stock2.save()

rental1 = Rental.new({
'customer_id' => customer1.id,
'stock_id' => stock1.id,
'rent_date' => '12/04/19'
})
rental1.save()

rental2 = Rental.new({
'customer_id' => customer1.id,
'stock_id' => stock1.id,
'rent_date' => '12/04/19'
})
rental2.save()

rental3 = Rental.new({
'customer_id' => customer2.id,
'stock_id' => stock1.id,
'rent_date' => '12/04/19'
})
rental3.save()
# rental1.delete()

binding.pry
nil
