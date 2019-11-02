import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:appdartang/pokemon.dart';

@Component(
    selector:'my-app',
    templateUrl: 'app_component.html',
    styleUrls: ["app_component.css"],
    directives: [formDirectives]
)
class AppComponent{
    var name="oscar javier campos herrera";
    Pokemon p1=Pokemon(id: 1,name: 'raichu');
}