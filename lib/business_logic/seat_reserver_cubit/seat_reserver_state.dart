part of 'seat_reserver_cubit.dart';

@immutable
abstract class SeatReserverState {}

class SeatReserverInitial extends SeatReserverState {}

class BeforeChangeSeateState extends SeatReserverState {}

class ChangeSeateState extends SeatReserverState {}

class MoreSeatsState extends SeatReserverState {
  static String errorText = "عزرا لا يمكنك ان تحجز اكثر من 6 كراسي";
}
