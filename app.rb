require 'sinatra'
require 'dotenv'
Dotenv.load

require_relative 'contentful_consumer'
consumer = ContentfulConsumer.new(ENV["SPACE_ID"], ENV["TOKEN"])
require_relative 'recipe_decorator'

get "/" do
  @recipes = consumer.recipes.map { |recipe| RecipeDecorator.new(recipe) }
  erb :index
end

get "/recipes/:id" do
  @recipe = RecipeDecorator.new(consumer.recipe(params[:id]))
  if @recipe
    erb :show
  else
    status 404
    erb :not_found
  end
end
