import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/view/body_white_container.dart';
import 'package:testapp/presentation/widget/available_ticket_widget.dart';
import 'package:testapp/presentation/widget/drawer.dart';

class TicketsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: Text('تذاكر'),
      ),
      body: Center(
        child: BodyWhiteContainer(
          bodyChild: Column(children: [
            AvailableTickets(
              ticketNumber: "#111111",
              price: '200',
              from: 'القاهرة',
              to: 'الأسكندرية',
              text1: 'تاريخ الرحلة',
              text2: 'الأثنين,29اغسطس',
              time: '10:30صباحا ',
              type: 'vip',
              typeColor: MyThemeData.appyellow,
            ),
            AvailableTickets(
              ticketNumber: "#222222",
              price: '150',
              from: 'الأسكندرية',
              to: 'القاهرة',
              text1: 'تاريخ الرحلة',
              text2: 'الأربعاء,7سبتمبر',
              time: '10:30صباحا ',
              type: 'Regular',
              typeColor: MyThemeData.dappblue,
            ),
          ]),
        ),
      ),
    );
  }
}
