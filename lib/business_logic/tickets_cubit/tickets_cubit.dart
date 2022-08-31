import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tickets_state.dart';

class TicketsCubit extends Cubit<TicketsState> {
  TicketsCubit() : super(TicketsInitial());
}
