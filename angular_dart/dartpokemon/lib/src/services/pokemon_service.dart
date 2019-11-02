import 'dart:convert';

import 'package:dartpokemon/src/models/pokemon.dart';
import 'package:http/http.dart' as http;
class PokemonService{
        var URL='https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
        PokeHub pokeHub;
        Future<PokeHub> fetchPokemonData() async{
                var res=await http.get(URL); 
                var decodedJson=jsonDecode(res.body);
                pokeHub=PokeHub.fromJson(decodedJson);
                print(pokeHub.toJson());
                return pokeHub;
        }
}