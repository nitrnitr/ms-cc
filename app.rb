require 'sinatra'
require 'dotenv'
Dotenv.load

require_relative 'contentful_consumer'
consumer = ContentfulConsumer.new(ENV["SPACE_ID"], ENV["TOKEN"])

get "/" do
  @recipes = consumer.recipes
  erb :index, recipes: @recipes
end

get "/recipes/:id" do
  @recipe = consumer.recipe(params[:id])
  if @recipe
    erb :show, recipe: @recipe
  else
    status 404
    erb :not_found
  end
end
