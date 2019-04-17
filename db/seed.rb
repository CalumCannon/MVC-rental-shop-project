require_relative('../models/customer.rb')
require_relative('../models/rental.rb')
require_relative('../models/stock.rb')
require('pry-byebug')

# CUSTOMERS

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

customer3 = Customer.new({
'name' => 'Steve Zissou',
'age' => 27,
})
customer3.save()

# STOCKS

stock1 = Stock.new({
'name' => 'Star Craft',
'amount' => 10,
'price' => 20,
'image' => '/images/starcraft_cover.jpeg',
'type' => 'Game'
})
stock1.save()

stock2 = Stock.new({
'name' => 'Life Aquatic',
'amount' => 100,
'price' => 12,
'image' => '/images/LifeAquatic.jpg',
'type' => 'Film'
})
stock2.save()

stock3 = Stock.new({
'name' => 'Die Hard',
'amount' => 100,
'price' => 12,
'image' => '/images/diehard.jpeg',
'type' => 'Film'
})
stock3.save()

stock4 = Stock.new({
'name' => 'Counter Strike',
'amount' => 100,
'price' => 18,
'image' => '/images/cs.jpeg',
'type' => 'Game'
})
stock4.save()

stock5 = Stock.new({
'name' => 'Game of Thrones',
'amount' => 100,
'price' => 18,
'image' => '/images/GoT.jpg',
'type' => 'TV-Show'
})
stock5.save()

stock6 = Stock.new({
'name' => 'Spaced',
'amount' => 100,
'price' => 18,
'image' => '/images/spaced.jpg',
'type' => 'TV-Show'
})
stock6.save()

# RENTALS

rental1 = Rental.new({
'customer_id' => customer1.id,
'stock_id' => stock1.id,
'rent_date' => '12/04/19'
})
rental1.save()

rental2 = Rental.new({
'customer_id' => customer3.id,
'stock_id' => stock2.id,
'rent_date' => '12/04/19'
})
rental2.save()

rental3 = Rental.new({
'customer_id' => customer2.id,
'stock_id' => stock6.id,
'rent_date' => '12/04/19'
})
rental3.save()
# rental1.delete()


binding.pry
nil
