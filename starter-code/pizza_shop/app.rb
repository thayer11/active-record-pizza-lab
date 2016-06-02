class PizzaShop < Sinatra::Base

    # index lists all pizzas
    get "/pizzas" do 
        @pizzas = Pizza.all
        # "We have pizzas"
        erb :pizzas
    end

    # new = render a new pizza form
    get "/pizzas/new" do
        erb :new
    end

    # create new pizza
    post "/pizzas" do
        params = {name: "Mrs Robinson", sauce: "red", cheese: true, mushrooms: true, extra_toppings: "virgin olive oil"}
        @pizza = Pizza.new(params);
        @pizza.save
        "New pizza saved"
    end

end
