require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/stock.rb' )
also_reload( '../models/*' )

get '/stocks' do
  @stocks = Stock.all()
  erb ( :"stocks/index" )
end

get '/stocks/new' do
     erb(:"stocks/new")
end

get '/stocks/:id' do
  @stock = Stock.find_by_id(params['id'].to_i)
  erb(:"stocks/show")
end

post '/stocks' do
  stock = Stock.new(params)
  stock.save
  redirect to("/stocks")
end

post '/stocks/:id/delete' do
  Stock.find_by_id(params[:id]).delete()
  redirect to('/stocks')
end

get '/stocks/:id/edit' do
  @stock = Stock.find_by_id(params[:id])
  erb(:'stocks/edit')
end

post '/stocks/:id/edit' do
  stock = Stock.new(params)
  stock.update()
  redirect to ("/stocks")
end
