class PokemonController < ApplicationController
  def show

    pokemon_id = params[:id]
    res = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{pokemon_id}/")
    body = JSON.parse(res.body)

    pokemon_name = body["name"] # should be "pikachu"
    pokemon_types = [];

    body["types"].each do |type|
      pokemon_types << type["type"]["name"]
    end

    res = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_KEY"]}&q=#{pokemon_name}&rating=g")
    body = JSON.parse(res.body)

    gif_url = body["data"].sample["url"]


    render json: { "id": pokemon_id,
                   "name": pokemon_name,
                   "types": pokemon_types,
                   "gif": gif_url}

  end
end
