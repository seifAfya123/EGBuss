import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/business_logic/seat_reserver_cubit/seat_reserver_cubit.dart';
import 'package:testapp/constants/end_points.dart';
import 'package:testapp/data/local/cache_helper.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/view/body_white_container.dart';
import 'package:testapp/presentation/widget/appbar_title_text.dart';
import 'package:testapp/presentation/widget/custom_elevated_button.dart';
import 'package:testapp/presentation/widget/default_button_text.dart';
import 'package:testapp/presentation/widget/error_snack_bar.dart';
import 'package:testapp/presentation/widget/seat.dart';

class SeatReservation extends StatelessWidget {
  const SeatReservation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CupertinoNavigationBar(
          leading: CupertinoNavigationBarBackButton(color: Colors.white),
          backgroundColor: MyThemeData.appblue,
          middle: AppbarTitleText(titleText: "اختر مقعدك"),
        ),
        body: BodyWhiteContainer(
          withPadding: true,
          bodyChild: BlocProvider(
            create: (context) => SeatReserverCubit()..getSeatsFromApi(),
            child: BlocConsumer<SeatReserverCubit, SeatReserverState>(
              listener: (context, state) {
                if (state is MoreSeatsState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      ErrorSnackBar(errorText: MoreSeatsState.errorText));
                }
              },
              builder: (context, state) {
                SeatReserverCubit mycubit =
                    BlocProvider.of<SeatReserverCubit>(context);
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      height: 10.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("المقاعد",
                                  style: Theme.of(context).textTheme.bodyText1),
                              mycubit.choosenSeats.isEmpty
                                  ? const Text("اختر مقعدك")
                                  : choosenSeats(mycubit.choosenSeats)
                            ],
                          ),
                          SizedBox(
                            width: 38.w,
                            height: 9.h,
                            child: CustomElevatedButton(
                              myWidgets: const DefaultButtonText(text: "حجز"),
                              otpressFunction: () {
                                Navigator.pushNamed(context,
                                    RoutNamesDart.rConfirmReservationScreen);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    seatsList(mycubit),
                    SizedBox(
                      height: 7.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          guide(
                              circleColor: MyThemeData.appyellow,
                              titleText: "تم اختياره",
                              context: context),
                          guide(
                              circleColor: Colors.grey,
                              titleText: "متاح",
                              context: context),
                          guide(
                              circleColor: MyThemeData.appDarkblue,
                              titleText: "غير متاح",
                              context: context),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget choosenSeats(List<String> seatsNumbers) {
    String data = "";
    for (var seat in seatsNumbers) {
      CacheHelper.getDataFromSharedPreference(key: appLanguageSharedKey) == 'ar'
          ? data += "$seat ,"
          : data += ", $seat";
    }
    return Text(data, textDirection: TextDirection.ltr);
  }

  Widget guide({
    required Color circleColor,
    required String titleText,
    required BuildContext context,
  }) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 1.w),
          width: 5.w,
          decoration: BoxDecoration(shape: BoxShape.circle, color: circleColor),
        ),
        Text(titleText, style: Theme.of(context).textTheme.bodyText1)
      ],
    );
  }

  Widget seatsList(SeatReserverCubit mycubit) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: mycubit.seatsStatus.length,
        itemBuilder: (BuildContext context, int index) {
          return carRow(index, mycubit, context);
        },
      ),
    );
  }

  carRow(int index, SeatReserverCubit myCubit, BuildContext context) {
    List<Widget> seats = [];
    for (int i = 0; i < myCubit.seatsStatus[index].length; i++) {
      seats.add(
        Seat(
          seatStatus: myCubit.seatsStatus[index][i],
          fun: () => myCubit.reserveSeat(index, i),
        ),
      );
    }
    seats.add(
      Text(index.toString(), style: Theme.of(context).textTheme.bodyText2),
    );
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
      child: Column(
        children: [
          index == 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(left: 3.w, right: 3.w, bottom: 3.h),
                      height: 15.w,
                      width: 35.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.w),
                        color: MyThemeData.appDarkblue,
                      ),
                      child: const DefaultButtonText(text: "السائق"),
                    ),
                  ],
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: seats,
          ),
        ],
      ),
    );
  }
}
