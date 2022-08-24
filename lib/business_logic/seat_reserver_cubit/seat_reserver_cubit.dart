import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testapp/constants/constant_data.dart';
import 'package:testapp/presentation/widget/seat.dart';

part 'seat_reserver_state.dart';

class SeatReserverCubit extends Cubit<SeatReserverState> {
  SeatReserverCubit() : super(SeatReserverInitial());
  List<List<SeatStatus>> seatsStatus = [
    [
      SeatStatus.notAvailable,
      SeatStatus.notAvailable,
      SeatStatus.notAvailable,
      SeatStatus.notAvailable,
    ],
    [
      SeatStatus.notAvailable,
      SeatStatus.available,
      SeatStatus.notAvailable,
      SeatStatus.notAvailable,
    ],
    [
      SeatStatus.notAvailable,
      SeatStatus.available,
      SeatStatus.available,
      SeatStatus.available,
    ],
  ];
  reserveSeat(int seatIndexChar, int seatIndexNumber) {
    emit(BeforeChangeSeateState());
    if (seatsStatus[seatIndexChar][seatIndexNumber] == SeatStatus.available) {
      seatsStatus[seatIndexChar][seatIndexNumber] = SeatStatus.choosed;
    } else if (seatsStatus[seatIndexChar][seatIndexNumber] == SeatStatus.choosed) {
      seatsStatus[seatIndexChar][seatIndexNumber] = SeatStatus.available;
    }
    emit(ChangeSeateState());
  }
}
