require 'json'
require 'contentful'

class ContentfulConsumer
  def initialize(space_id, token)
    @space_id = space_id
    @token = token
  end

  def space_id
    @space_id
  end

  def token
    @token
  end

  def recipes
    client.entries(content_type: "recipe")
  end

  def recipe(id)
    client.entry(id)
  end

  private

  def client
    client ||= Contentful::Client.new(
      space: space_id,
      access_token: token
    )
  end
end
