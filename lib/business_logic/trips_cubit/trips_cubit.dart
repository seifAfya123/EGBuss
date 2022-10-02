import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'trips_state.dart';

class TripsCubit extends Cubit<TripsState> {
  TripsCubit() : super(TripsInitial());

  selectTrip() {
    emit(SelectingTrip());
    emit(SelectedTrip());
  }
}
