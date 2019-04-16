require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/customer.rb' )
also_reload( '../models/*' )
require('pry-byebug')

get '/customers' do
  @customers = Customer.all()
  erb ( :"customers/index" )
end

get '/customers/new' do
     erb(:"customers/new")
end

get '/customers/:id' do
  @customer = Customer.find_by_id(params['id'].to_i)
  @rentals = @customer.rentals
  erb(:"customers/show")
end

post '/customers' do
  customer = Customer.new(params)
  customer.save
  redirect to("/customers")
end

post '/customers/:id/delete' do
  Customer.find_by_id(params[:id]).delete()
  redirect to('/customers')
end

get '/customers/:id/edit' do
  @customer = Customer.find_by_id(params[:id])
  erb(:'customers/edit')
end

post '/customers/:id/edit' do
  customer = Customer.new(params)
  customer.update()
  redirect to ("/customers")
end

post '/customers/search' do
  @customers = Customer.search(params[:input].capitalize)
  erb ( :'customers/index' )
end
