# frozen_string_literal: true

require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('./models/pizza_order')
also_reload('./models/*')

get '/' do
  erb(:home)
end

# index
get '/pizzas' do
  @orders = PizzaOrder.all()
  erb(:index)
end

# new
get '/pizzas/new' do
  erb(:new)
end

# create
post '/pizzas' do
  @order = PizzaOrder.new(params)
  @order.save
  erb(:create)
end

# show
get '/pizzas/:id' do
  id = params['id'].to_i()
  @order = PizzaOrder.find(id)
  erb(:show)
end

# update
post '/pizzas/update/:id' do
  id = params['id'].to_i
  # pizza_order = PizzaOrder.find(id)
  # pizza_order.update(params)
  @pizza_order = PizzaOrder.new(params)
  @pizza_order.update()
  redirect '/pizzas/' + params['id']
end

# edit
get '/pizzas/:id/edit' do
  id = params['id'].to_i
  # pizza_order = PizzaOrder.find(@id)
  # @first_name = pizza_order.first_name
  # @last_name = pizza_order.last_name
  # @topping = pizza_order.topping
  # @quantity = pizza_order.quantity
  @pizza_order = PizzaOrder.find(id)
  erb(:edit)
end

# destroy
post '/pizzas/:id/delete' do
  id = params['id']
  # order = PizzaOrder.find(id)
  # order.delete()
  PizzaOrder.delete(id)
  redirect '/pizzas'
end
