class PizzaShop < Sinatra::Base
  require 'json'
  # INDEX - like index.html, a list of pizzas
  # GET "/pizzas" - Gets all the pizzas we have
  get "/pizzas" do
    @pizzas = Pizza.all.to_json
  end

  # CREATE - where the new form POSTs to, it does the actual creating
  # POST "/pizzas" - Create a new pizza, add it to our list
  post "/pizzas" do
    #these will eventually be real params passed from the client
    new_pizza = JSON.parse request.body.read
    @pizza = Pizza.new(new_pizza)
    @pizza.save
  end

  # SHOW - show details about just one pizza
  # GET "/pizzas/3" - Just get one specific pizza (that already exists)
  get "/pizzas/:id" do
    @pizza = Pizza.find(params[:id]).to_json
  end

  # UPDATE - like CREATE, this does the actual updating
  # PUT "/pizzas/3" - Updates a specific pizza
  put "/pizzas/:id" do
    attributes_to_update = JSON.parse request.body.read
    @pizza = Pizza.find(params[:id])
    @pizza.update_attributes(attributes_to_update)
  end

  # DESTROY - totally nukes a pizza from the database
  # DELETE "/pizzas/3" - Deletes a specific pizza
  delete "/pizzas/:id" do
    @pizza = Pizza.find(params[:id])
    @pizza.destroy
  end

end
