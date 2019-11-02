import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_bloc/angular_bloc.dart';
import './counter_bloc.dart';

@Component(
  selector:'counter-component',
  templateUrl: 'counter_component.html',
  styleUrls:['counter_component.css'],
  directives: [MaterialFabComponent],
  providers: [ClassProvider(CounterBloc)],
  pipes: [BlocPipe]
)
class CounterComponent implements OnDestroy{
  final CounterBloc counterBloc;
  CounterComponent(this.counterBloc){}
  @override
  void ngOnDestroy() {
    counterBloc.close();
  }
void increment(){
  counterBloc.add(CounterEvent.increment);
}
void decrement(){
  counterBloc.add(CounterEvent.decrement);
}
}