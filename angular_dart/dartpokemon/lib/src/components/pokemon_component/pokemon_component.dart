import 'package:angular/angular.dart';
import 'package:dartpokemon/src/components/counter_component/counter_component.dart';
import 'package:dartpokemon/src/models/pokemon.dart';
import 'package:dartpokemon/src/services/pokemon_service.dart';


@Component(
    selector: 'pokemon-component',
    templateUrl: 'pokemon_component.html',
    styleUrls: ["pokemon_component.css"],
    providers: [ClassProvider(PokemonService)],
    directives: [NgFor, NgIf,CounterComponent])
class PokemonComponent implements OnInit {
  PokeHub pokeHub;
  PokemonService _pokemonService;
  PokemonComponent(this._pokemonService);
  Pokemon pokemon;
  @override
  void ngOnInit() {
    fetchData();
  }

  fetchData() async {
    pokeHub = await _pokemonService.fetchPokemonData();
  }

  void onSelect(Pokemon pokemon) => this.pokemon = pokemon;
}
