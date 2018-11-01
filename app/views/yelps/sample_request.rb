require 'rubygems'
require 'httparty'

class TheAPI
  include HTTParty
  base_uri "foodchooser.herokuapp.com/"

  def restaurants
    self.class.get('/restaurants.json')
  end
end

the_api = TheAPI.new
print the_api.restaurants
