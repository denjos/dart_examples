import 'package:angular/angular.dart';
import 'package:dartpokemon/src/components/pokemon_component/pokemon_component.dart';


@Component(
  selector: 'app',
  templateUrl: 'app_component.html',
  styleUrls: ['app_component.css'],
  directives: [PokemonComponent]
)
class AppComponent{
  var name='oscar';

}