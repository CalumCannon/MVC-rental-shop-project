require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/customer_controller.rb')
require_relative('controllers/rental_controller.rb')
require_relative('controllers/stock_controller.rb')
also_reload( './models/*' )

get '/' do
 erb(:index)
end
