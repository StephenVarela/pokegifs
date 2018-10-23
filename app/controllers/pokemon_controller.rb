class PokemonController < ApplicationController
  def show

    pokemon_id = params[:id]
    res = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{pokemon_id}/")
    body = JSON.parse(res.body)
    puts body["name"] # should be "pikachu"



    render json: { "message": "ok" }


  end
end
