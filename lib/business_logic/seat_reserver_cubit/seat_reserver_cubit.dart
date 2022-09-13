import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testapp/constants/const_test_data.dart';
import 'package:testapp/constants/constant_data.dart';
import 'package:testapp/presentation/widget/seat.dart';

part 'seat_reserver_state.dart';

class SeatReserverCubit extends Cubit<SeatReserverState> {
  SeatReserverCubit() : super(SeatReserverInitial());
  int maxSeatsNumber = 6;
  List<List<SeatStatus>> seatsStatus = [];
  getSeatsFromApi() {
    seatsStatus = seatsStatusFakeData;
  }

  List<String> choosenSeats = [];
  reserveSeat(int seatIndexChar, int seatIndexNumber) {
    emit(BeforeChangeSeateState());
    if (seatsStatus[seatIndexChar][seatIndexNumber] == SeatStatus.available) {
      if (choosenSeats.length >= maxSeatsNumber) {
        emit(MoreSeatsState());
      } else {
        choosenSeats.add("$seatIndexChar$seatIndexNumber");
        seatsStatus[seatIndexChar][seatIndexNumber] = SeatStatus.choosed;
      }
    } else if (seatsStatus[seatIndexChar][seatIndexNumber] ==
        SeatStatus.choosed) {
      choosenSeats.remove("$seatIndexChar$seatIndexNumber");

      seatsStatus[seatIndexChar][seatIndexNumber] = SeatStatus.available;
    }
    emit(ChangeSeateState());
  }
}
