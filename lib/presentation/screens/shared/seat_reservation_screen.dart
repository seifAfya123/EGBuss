import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/business_logic/seat_reserver_cubit/seat_reserver_cubit.dart';
import 'package:testapp/presentation/widget/custom_elevated_button.dart';
import 'package:testapp/presentation/widget/default_button_text.dart';
import 'package:testapp/presentation/widget/from_to_text_container.dart';
import 'package:testapp/presentation/widget/seat.dart';

class SeatReservation extends StatelessWidget {
  const SeatReservation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("اختر مقعدك"),
        ),
        body: Column(
          children: [
            const FromToTextContainer(),
            Container(
              height: 15.h,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                  top: BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text("غير متاح"),
                      Text("متاح"),
                    ],
                  ),
                  SizedBox(width: 5.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.w),
                          color: Colors.red,
                        ),
                        width: 5.w,
                        height: 5.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.w),
                          color: Colors.grey,
                        ),
                        width: 5.w,
                        height: 5.w,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("#56465223"),
                      Row(
                        children: [
                          const Text(
                            "12:30 PM",
                            textDirection: TextDirection.ltr,
                          ),
                          Icon(
                            Icons.bus_alert,
                            size: 15.w,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<SeatReserverCubit, SeatReserverState>(
                builder: (context, state) {
                  if (state is ChangeSeateState) {}
                  SeatReserverCubit mycubit =
                      BlocProvider.of<SeatReserverCubit>(context);
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: mycubit.seatsStatus.length,
                    itemBuilder: (BuildContext context, int index) {
                      return carRow(
                        index,
                        mycubit.seatsStatus[index],
                        mycubit,
                      );
                    },
                  );
                },
              ),
            ),
            CustomElevatedButton(
              myWidgets: const DefaultButtonText(text: 'احجز الان'),
              otpressFunction: () {},
            ),
            SizedBox(height: 5.h)
          ],
        ),
      ),
    );
  }

  carRow(index, lista, SeatReserverCubit myCubit) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
      height: 10.h,
      child: Row(
        children: [
          Seat(
            seatStatus: lista[0],
            fun: () => myCubit.reserveSeat(index, 0),
          ),
          const Spacer(flex: 1),
          Seat(
            seatStatus: lista[1],
            fun: () => myCubit.reserveSeat(index, 1),
          ),
          const Spacer(flex: 4),
          Seat(
            seatStatus: lista[2],
            fun: () => myCubit.reserveSeat(index, 2),
          ),
          const Spacer(flex: 1),
          Seat(
            seatStatus: lista[3],
            fun: () => myCubit.reserveSeat(index, 3),
          ),
        ],
      ),
    );
  }
}
