part of 'trips_cubit.dart';

@immutable
abstract class TripsState {}

class TripsInitial extends TripsState {}

class SelectingTrip extends TripsState {}

class SelectedTrip extends TripsState {}
