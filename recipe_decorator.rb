require 'forwardable'

class RecipeDecorator
  extend Forwardable
  def_delegators :@recipe, :id, :description, :photo, :title

  def initialize(recipe)
    @recipe = recipe
  end

  def recipe
    @recipe
  end

  def has_chef_name?
    !chef_name.nil?
  end

  def chef_name
    recipe.respond_to?(:chef) ? recipe.chef.name : nil
  end

  def has_tags?
    !tags.nil?
  end

  def tags
    recipe.respond_to?(:tags) ? recipe.tags : nil
  end

  def joined_tags
    recipe.tags.map { |tag| tag.name.capitalize }.join(", ")
  end
end
