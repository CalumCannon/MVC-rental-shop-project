require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/rental.rb' )
require_relative( '../models/stock.rb' )
require_relative( '../models/customer.rb' )
also_reload( '../models/*' )

get '/rentals' do
  @rentals = Rental.all()
  erb ( :"rentals/index" )
end

get '/rentals/new' do
     @rental = Rental.all()
     @customers = Customer.all()
     @stocks = Stock.all()
     erb(:"rentals/new")
end

get '/rentals/:id' do
  @rental = Rental.find_by_id(params['id'].to_i)
  erb(:"rentals/show")
end

post '/rentals' do
  rental = Rental.new(params)
  rental.save
  redirect to("/rentals")
end

post '/rentals/:id/delete' do
  Rental.find_by_id(params[:id]).delete()
  redirect to('/rentals')
end

get '/rentals/:id/restock' do
  Rental.find_by_id(params[:id]).restock()
  redirect to('/rentals')
end
