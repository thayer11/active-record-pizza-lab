class PizzaShop < Sinatra::Base

require 'json'
# require "/.models/pizza.rb"
#Index
get '/pizza' do 
	Pizza.all.to_json
end
#SHOw

get '/pizza/:id' do
	Pizza.find(params[:id]).to_json
end

#CREATE
post '/pizza' do
	@make_pizza = JSON.parse(request.body.read)
	@new_pizza = Pizza.new(@make_pizza)
	@new_pizza.save

end

#UPDATE
put '/pizza/:id' do 
	@create_pizza = JSON.parse(request.body.read)
	@another_pizza = Pizza.find(params[:id])
	@another_pizza.update_attributes(@create_pizza)

end 
#DELETE
delete '/pizza/:id' do 
	@no_more_pizza = Pizza.find(params[:id])
	@no_more_pizza.destroy


end


end

# RESTFUL ROUTES
